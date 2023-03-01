
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ["startDate", "endDate", "totalPrice"]
  static values = {
    pricePerNight: Number,
  }

  connect() {
    console.log("connect");
    console.log(this.startDateTarget);
    console.log(this.endDateTarget);
    console.log(this.pricePerNightValue);
  }

  updateTotalPrice() {
    console.log("this.updateTotalPrice")
    const startDate = new Date(this.start_date_target.value)
    const endDate = new Date(this.end_date_target.value)
    const totalPrice = this.totalPriceTarget.value

    if (startDate && endDate && this.pricePerNightValue) {
      const nights = Math.ceil((endDate - startDate) / (1000 * 60 * 60 * 24))
      const newTotalPrice = nights * pricePerNight

      if (newTotalPrice !== totalPrice) {
        this.totalPriceTarget.value = newTotalPrice
      }
    }
  }
}
