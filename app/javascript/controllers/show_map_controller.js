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
    
    // スタート地点のマーカーを定義する
    const startMarker = {
      path: "M10.453 14.016l6.563-6.609-1.406-1.406-5.156 5.203-2.063-2.109-1.406 1.406zM12 2.016q2.906 0 4.945 2.039t2.039 4.945q0 1.453-0.727 3.328t-1.758 3.516-2.039 3.070-1.711 2.273l-0.75 0.797q-0.281-0.328-0.75-0.867t-1.688-2.156-2.133-3.141-1.664-3.445-0.75-3.375q0-2.906 2.039-4.945t4.945-2.039z",
      fillColor: "blue",
      fillOpacity: 0.6,
      strokeWeight: 0,
      rotation: 0,
      scale: 2,
      anchor: new google.maps.Point(15, 30),
    };


    // 地図を作成し、中間地点を中心に表示する。
    const map = new google.maps.Map(this.element, {
      zoom: 15,
      center: midLocation
    });
    // 出発地点の地図のマーカーを表示する
    new google.maps.Marker({
      position: startpointLocation,
      map: map,
      // icon: startMarker,
      // color: blue
    });
    // 目的地の地図のマーカーを表示する
    new google.maps.Marker({
      position: destinationLocation,
      // animation: google.maps.Animation.DROP,
      map: map
    });
  }
}
