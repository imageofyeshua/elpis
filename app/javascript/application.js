// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import { Turbo } from "@hotwired/turbo-rails"

Turbo.setConfirmMethod((message) => {
  const dialog = document.getElementById("turbo-confirm-dialog")
  const messageEl = document.getElementById("turbo-confirm-message")
  const confirmBtn = document.getElementById("turbo-confirm-accept")
  const cancelBtn = document.getElementById("turbo-confirm-cancel")

  // Inject the message from data-turbo-confirm
  messageEl.textContent = message

  // Show the native backdrop modal
  dialog.showModal()

  return new Promise((resolve) => {
    // Handle Confirm click
    confirmBtn.onclick = () => {
      dialog.close()
      resolve(true)
    }

    // Handle Cancel click
    cancelBtn.onclick = () => {
      dialog.close()
      resolve(false)
    }

    // Handle ESC key or backdrop cancel
    dialog.onclose = () => {
      resolve(false)
    }
  })
})
