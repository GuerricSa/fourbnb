import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="total-price"
export default class extends Controller {
  static targets = ["price", "hours", "total"]
  connect() {
  }

  count() {
    let totalPrice = (this.priceTarget.innerText) * (this.hoursTarget.value);
    if (this.hoursTarget.value > 1) {
      this.totalTarget.innerHTML = `TOTAL : ${totalPrice} € pour ${this.hoursTarget.value} heures`
    } else if (this.hoursTarget.value = 1) {
      this.totalTarget.innerHTML = `TOTAL : ${totalPrice} € pour ${this.hoursTarget.value} heure`
    }
  }
}
