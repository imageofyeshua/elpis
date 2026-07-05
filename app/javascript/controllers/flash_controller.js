import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    // Automatically auto-dismiss after 5 seconds
    setTimeout(() => {
      this.dismiss()
    }, 5000)
  }

  dismiss() {
    // Smoothly fade out before removing from DOM
    this.element.classList.add("opacity-0", "scale-95")
    
    setTimeout(() => {
      this.element.remove()
    }, 500)
  }
}
