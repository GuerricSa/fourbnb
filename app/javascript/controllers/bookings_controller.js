import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="bookings"
export default class extends Controller {
  static targets = ["futureBookings", "pastBookings", "futureTab", "pastTab"]

  connect() {
  }

  future() {
    this.futureBookingsTarget.classList.remove("d-none")
    this.pastBookingsTarget.classList.add("d-none")
    this.futureTabTarget.classList.add("active")
    this.pastTabTarget.classList.remove("active")
  }

  past() {
    this.futureBookingsTarget.classList.add("d-none")
    this.pastBookingsTarget.classList.remove("d-none")
    this.futureTabTarget.classList.remove("active")
    this.pastTabTarget.classList.add("active")
  }
}
