import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "menu" ]
  static classes = [ "active" ] // Maps to data-dropdown-active-class="hidden"

  connect() {
    // Optional: Ensure it starts hidden if not explicitly set in HTML
  }

  toggle(event) {
    event.stopPropagation() // Prevents the window click event from firing instantly
    this.menuTarget.classList.toggle(this.activeClass)
  }

  hide(event) {
    // If the click happened outside the controller's element, hide the menu
    if (!this.element.contains(event.target)) {
      this.menuTarget.classList.add(this.activeClass)
    }
  }
}
