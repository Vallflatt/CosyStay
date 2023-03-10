import { Controller } from "@hotwired/stimulus"

const options = {
  enableHighAccuracy: true,
  maximumAge: 0
};

// Connects to data-controller="geolocation"
export default class extends Controller {
  static values = { url: String }
  static targets = [ "distance" ]

  search() {
    navigator.geolocation.getCurrentPosition(this.success.bind(this), this.error, options);
  }

  success(pos) {
    const crd = pos.coords;
    // redirect with coordinates in params
    location.assign(`/flats?lat=${crd.latitude}&lng=${crd.longitude}&dist=${this.distanceTarget.value}`)
  }

  error(err) {
    console.warn(`ERROR(${err.code}): ${err.message}`);
  }
}
