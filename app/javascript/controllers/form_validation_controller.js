import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form-validation"
export default class extends Controller {
  static targets = ["field", "error", "submit"]

  connect() {
    // Disable native browser validation tooltips so we can use Tailwind instead
    this.element.setAttribute("novalidate", true)
  }

  // Validates a single field when it loses focus or on input
  validateField(event) {
    const field = event.target
    this.toggleValidationStyles(field)
  }

  // Validates the entire form upon submission
  validateForm(event) {
    let isValid = true

    this.fieldTargets.forEach((field) => {
      this.toggleValidationStyles(field)
      if (!field.checkValidity()) {
        isValid = false
      }
    })

    if (!isValid) {
      event.preventDefault() // Stop form submission if invalid
      
      // Focus on the first invalid field
      const firstInvalid = this.element.querySelector(":invalid")
      if (firstInvalid) firstInvalid.focus()
    }
  }

  // Helper to change Tailwind classes based on validity
  toggleValidationStyles(field) {
    const errorTarget = this.errorTargets.find(el => el.dataset.fieldName === field.name)
    
    if (field.checkValidity()) {
      // Valid State
      field.classList.remove("border-red-500", "focus:ring-red-500", "focus:border-red-500")
      field.classList.add("border-green-500", "focus:ring-green-500", "focus:border-green-500")
      
      if (errorTarget) {
        errorTarget.classList.add("hidden")
        errorTarget.textContent = ""
      }
    } else {
      // Invalid State
      field.classList.remove("border-green-500", "focus:ring-green-500", "focus:border-green-500")
      field.classList.add("border-red-500", "focus:ring-red-500", "focus:border-red-500")
      
      if (errorTarget) {
        errorTarget.classList.remove("hidden")
        errorTarget.textContent = field.validationMessage // Native browser error message (e.g., "Please fill out this field.")
      }
    }
  }
}
