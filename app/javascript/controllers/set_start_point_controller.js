import { Controller } from "@hotwired/stimulus"
import { current } from "daisyui/src/colors";

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
