import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "name"]

  display() {
    if (this.inputTarget.files && this.inputTarget.files.length > 0) {
      const fileName = this.inputTarget.files[0].name
      this.nameTarget.textContent = fileName
      this.nameTarget.classList.remove("italic")
    } else {
      this.nameTarget.textContent = "No file chosen"
      this.nameTarget.classList.add("italic")
    }
  }
}
