import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="link-validation"
export default class extends Controller {
  
  validate(event) {
    const input = document.getElementById("link-input")
    const errorDiv = document.getElementById("err-msg")
    
    // Trim whitespace to catch users just pressing spacebar
    if (input.value.trim() === "") {
      event.preventDefault() // Stop form submission

      // Apply Tailwind error styling to the input
      input.classList.add("border-red-500", "focus:ring-red-500", "focus:border-red-500")
      input.classList.remove("border-gray-300", "focus:ring-indigo-500", "focus:border-indigo-500")

      // Append the error text cleanly into the div
      errorDiv.textContent = "Please enter a valid link before submitting."
      errorDiv.classList.remove("hidden")
    }
  }

  // Optional: Clear the error as soon as the user starts typing again
  clear() {
    const input = document.getElementById("link-input")
    const errorDiv = document.getElementById("err-msg")

    if (input.value.trim() !== "") {
      input.classList.remove("border-red-500", "focus:ring-red-500", "focus:border-red-500")
      input.classList.add("border-gray-300", "focus:ring-indigo-500", "focus:border-indigo-500")
      
      errorDiv.textContent = ""
      errorDiv.classList.add("hidden")
    }
  }
}
