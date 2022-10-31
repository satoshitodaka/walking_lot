import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ 'startpointname', 'startpointaddress', 'latitude', 'longitude', 'map' ]
  connect() {
    this.renderMap()
  }

  renderMap() {
    let currentMarker;
    // 予め適当な場所をセットしておく
    const centerLocation = { lat: 35.6895014, lng: 139.6917337 }
    const map = new google.maps.Map(this.mapTarget, {
      center: centerLocation,
      zoom: 16,
      disableDefaultUI: true,
      zoomControl: true,
    });

    // 現在地を取得してピンを立てる
    // 定数locationButtonを定義し、要素buttonを代入する
    const locationButton = document.createElement("button");
    // ボタンのテキスト表示を設定
    locationButton.textContent = "現在地から歩く";
    // ボタンのCSSクラスを定義する
    locationButton.classList.add("custom-map-control-button");
    map.controls[google.maps.ControlPosition.TOP_RIGHT].push(locationButton);
    locationButton.addEventListener("click", (e) => {
      // フォームのデフォルトの動作をキャンセルする
      e.preventDefault();
      // マーカーがあれば削除する
      if (currentMarker != null) {
        currentMarker.setMap(null)
      }
      if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(
          (position) => {
            const pos = {
              lat: position.coords.latitude,
              lng: position.coords.longitude,
            };
            // mapの中心に取得したposをセットする
            map.setCenter(pos);
            currentMarker = new google.maps.Marker({
              position: pos,
              map: map
            });
            // 設定したTargetの値に、イベントで取得した緯度経度情報を代入する。これにより、Form側で紐付けた入力欄に渡される
            this.latitudeTarget.value = pos.lat
            this.longitudeTarget.value = pos.lng
          }
        );
      } else {
        return false
      }
    });

    // SearchFormで出発地を指定してピンを立てる
    // 検索ボックスを作成する
    const input = document.getElementById("pac-input");
    const searchBox = new google.maps.places.SearchBox(input);
    map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

    // 検索結果を現在のマップのビューに偏らせる
    map.addListener("bounds_changed", () => {
      searchBox.setBounds(map.getBounds());
    });

    let markers = [];

    // 検索結果をユーザーが選択すると、イベントが発生
    searchBox.addListener("places_changed", () => {
      const places = searchBox.getPlaces();

      // 検索結果がなければ離脱
      if (places.length == 0) {
        return;
      }

      // 古いマーカーを削除する
      markers.forEach((marker) => {
        marker.setMap(null);
      });
      markers = [];

      const service = new google.maps.places.PlacesService(map);

      // 取得した情報に対し、アイコンと場所の情報を取得する
      const bounds = new google.maps.LatLngBounds();

      places.forEach((place) => {
        if (!place.geometry || !place.geometry.location){
          console.log("Returned place contains no geometry");
          return;
        }

        // 検索結果にマーカーを設定し、markersに含める
        let marker = new google.maps.Marker({
          map,
          title: place.name, //名称
          position: place.geometry.location, //緯度経度
          address: place.formatted_address, // 住所
          placeId: place.place_id
        })
        markers.push(marker);

        // 表示するウィンドウのコンテンツを設定する
        const contentString =
          `<div id="content">` +
            `<h3>${ marker.title }</h3>` +
            `<p>${ marker.address }</p>` +
            `<input type="button" id="setStartPoint" value="ここから歩く" class="btn btn-primary">` +
          "</div>";

        // infowindowを作成する
        const infowindow = new google.maps.InfoWindow({
          content: contentString,
        });

        let currentInfoWindow = null;

        // マーカーをクリックすると、マーカーの場所でinfoWindowを表示する
        marker.addListener("click", () => {
          // currentInfoWindowが存在すれば閉じる
          if (currentInfoWindow) {
            currentInfoWindow.close();
          }
          // currentInfoWindowとしてinfowindowを開く
          infowindow.open({
            map,
            anchor: marker
          });
          currentInfoWindow = infowindow;

          // infoWindowのDOMが用意できたら発火する
          currentInfoWindow.addListener('domready', () => {
            // infoWindowのボタンがクリックされたら発火する
            document.getElementById("setStartPoint").addEventListener("click", () => {
              this.startpointnameTarget.value = marker.title;
              this.startpointaddressTarget.value = marker.address;
              this.longitudeTarget.value = marker.position.lng();
              this.latitudeTarget.value = marker.position.lat();
            });   
          });
        });

        if (place.geometry.viewport) {
          bounds.union(place.geometry.viewport);
        } else {
          bounds.extend(place.geometry.location);
        }
      });
      map.fitBounds(bounds);
    });

    // 地図をクリックしてピンを立てる
    map.addListener("click", (e) => {
      // 最初にcurrentMarkerが空でなければ空にする
      if (currentMarker != null) {
        currentMarker.setMap(null)
      }

      if (infoWindow != null) {
        infoWindow.close()
      }
      // currentMarkerにマーカーをセットする。
      // マーカーのpositionに、clickした地点の情報latLngのlatとlngをそれぞれ代入する
      currentMarker = new google.maps.Marker({
        position: { lat: e.latLng.lat() ,lng: e.latLng.lng() },
        map: map
      });
      // 設定したTargetの値に、イベントで取得した緯度経度情報を代入する。これにより、Form側で紐付けた入力欄に渡される
      this.longitudeTarget.value = e.latLng.lng()
      this.latitudeTarget.value = e.latLng.lat()
    });
  }
}
