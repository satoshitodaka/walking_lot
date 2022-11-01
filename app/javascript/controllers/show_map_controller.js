import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="show-map"
export default class extends Controller {
  static values = {
    destinationlatitude: Number,
    destinationlongitude: Number,
    startpointlatitude: Number,
    startpointlongitude: Number,
  }

  connect() {
    this.renderMap(
      this.destinationlatitudeValue,
      this.destinationlongitudeValue,
      this.startpointlatitudeValue,
      this.startpointlongitudeValue
    )
  }
  renderMap(destinationlatitude, destinationlongitude, startpointlatitude, startpointlongitude) {
    // 中間地点の緯度経度を定義する
    const midlatitude = (destinationlatitude + startpointlatitude)/2
    const midlongitude = (destinationlongitude + startpointlongitude)/2
    
    // 目的地点を定義する。
    const destinationLocation = { lat: destinationlatitude, lng: destinationlongitude }
    // 出発地点を定義する
    const startpointLocation = { lat: startpointlatitude, lng: startpointlongitude }
    // 中間地点を定義する
    const midLocation = { lat: midlatitude, lng: midlongitude }
    
    // 地図を作成し、中間地点を中心に表示する。
    const map = new google.maps.Map(this.element, {
      zoom: 15,
      center: midLocation
    });
    // 出発地点の地図のマーカーを表示する
    new google.maps.Marker({
      position: startpointLocation,
      map: map,
      label: 'S'
    });
    // 目的地の地図のマーカーを表示する
    new google.maps.Marker({
      position: destinationLocation,
      map: map,
      label: 'G'
    });
  }
}
