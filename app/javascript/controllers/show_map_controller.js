import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="show-map"
export default class extends Controller {
  static values = {
    latitude: Number,
    longitude: Number
  }

  connect() {
    this.renderMap(this.latitudeValue, this.longitudeValue)
  }
  renderMap(latitude, longitude) {
    // 表示する地点を定義する。
    const targetLocation = { lat: latitude, lng: longitude }
    // 地図を作成する
    const map = new google.maps.Map(this.element, {
      zoom: 16,
      center: targetLocation
    });
    // 地図のマーカーを表示する
    new google.maps.Marker({
      position: targetLocation,
      map: map
    });
  }
}
