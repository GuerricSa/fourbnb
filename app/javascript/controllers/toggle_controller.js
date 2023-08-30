import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["togglableElement", "togglableElementForm"]
  connect() {
    console.log("Hello from toggle_controller")
  }
  move() {
    console.log(this.togglableElementTarget)
    this.togglableElementTarget.classList.toggle("d-none")
    this.togglableElementFormTarget.classList.toggle("d-none")
    this.togglableElementFormTarget.classList.toggle("position-relative")
  }
}
