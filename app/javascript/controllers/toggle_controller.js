import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = [ "button", "menu" ]

  toggle(event) {
    event.preventDefault()

    this.buttonTarget.classList.toggle("open")
    this.menuTarget.classList.toggle("flex")
    this.menuTarget.classList.toggle("hidden")
  }
}
