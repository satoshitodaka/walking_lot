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
    // 目的地点を定義する。
    const destinationPosition = new google.maps.LatLng(destinationlatitude, destinationlongitude)
    // 出発地点を定義する
    const startpointPosition = new google.maps.LatLng(startpointlatitude, startpointlongitude )

    const bounds = new google.maps.LatLngBounds();
 
    // 地図を作成し、中間地点を中心に表示する。
    const map = new google.maps.Map(this.element, {
      mapTypeControl: false,
    });
    // 出発地点の地図のマーカーを表示する
    const startpointMarker =  new google.maps.Marker({
      position: startpointPosition,
      map: map,
      label: 'S'
    });
    bounds.extend(startpointPosition);
    // 目的地の地図のマーカーを表示する
    new google.maps.Marker({
      position: destinationPosition,
      map: map,
      label: 'G'
    });
    bounds.extend(destinationPosition);
    
    map.fitBounds(bounds);
  }
}
