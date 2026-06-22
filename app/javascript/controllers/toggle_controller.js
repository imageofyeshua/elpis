import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = [ "button" ]

  toggle(event) {
    event.preventDefault()

    this.buttonTarget.classList.toggle("open")
  }
}
