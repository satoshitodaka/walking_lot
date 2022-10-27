import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ 'latitude', 'longitude', 'map' ]
  connect() {
    this.renderMap()
  }

  renderMap() {
    let currentMarker;
    // 予め適当な場所をセットしておく
    const centerLocation = { lat: 35.6895014, lng: 139.6917337 }
    const map = new google.maps.Map(this.mapTarget, {
      center: centerLocation,
      zoom: 16
    });

    // 現在地を取得する機能
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

    map.addListener("click", (e) => {
      // 最初にcurrentMarkerが空でなければ空にする
      if (currentMarker != null) {
        currentMarker.setMap(null)
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
