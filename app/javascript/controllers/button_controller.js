import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="button"
export default class extends Controller {
  static targets = ["date", "hours", "button"]
  connect() {
    this.buttonTarget.disabled = true
  }

  enabled() {
    if (this.dateTarget.value === "" || this.hoursTarget.value === "") {
      this.buttonTarget.disabled = true
    }
    else {
      this.buttonTarget.disabled = false
    }
  }
}
