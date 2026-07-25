// Prevent uploading of big images.
document.addEventListener("DOMContentLoaded", function () {
  const imageUpload = document.querySelector("#micropost_image");
  if (!imageUpload) return;

  imageUpload.addEventListener("change", function() {
    const file = this.files[0];
    if (!file) return;

    const size_in_megabytes = file.size/1024/1024;
    if (size_in_megabytes > 2) {
      showAlertModel(
        "File Too Large",
        "Maximum file size is 2MB. Please choose a smaller file."
      );
      this.value = "";
    }
  });
});

function showAlertModel(title, message) {
const modal = document.createElement("div");
  modal.className =
    "fixed inset-0 z-50 flex items-center justify-center p-4 bg-gray-900/50 backdrop-blur-sm transition-opacity duration-200 animate-fade-in";

  // Create modal card
  modal.innerHTML = `
    <div class="w-full max-w-md transform overflow-hidden rounded-2xl bg-white p-6 text-left shadow-xl transition-all sm:my-8">
      <!-- Icon & Header -->
      <div class="flex items-center gap-3 text-red-600">
        <div class="flex h-10 w-10 shrink-0 items-center justify-center rounded-full bg-red-100">
          <svg class="h-6 w-6 text-red-600" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" d="M12 9v3.75m-9.303 3.376c-.866 1.5.217 3.374 1.948 3.374h14.71c1.73 0 2.813-1.874 1.948-3.374L13.949 3.378c-.866-1.5-3.032-1.5-3.898 0L2.697 16.126zM12 15.75h.007v.008H12v-.008z" />
          </svg>
        </div>
        <h3 class="text-lg font-semibold leading-6 text-gray-900">${title}</h3>
      </div>

      <!-- Body Message -->
      <div class="mt-3">
        <p class="text-sm text-gray-500">${message}</p>
      </div>

      <!-- Action Button -->
      <div class="mt-5 sm:mt-6">
        <button type="button" id="close-modal-btn" class="inline-flex w-full justify-center rounded-lg bg-red-600 px-4 py-2.5 text-sm font-semibold text-white shadow-sm hover:bg-red-500 focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-red-600 transition-colors">
          Got it
        </button>
      </div>
    </div>
  `;

  document.body.appendChild(modal);

  // Close helper
  const closeModal = () => modal.remove();

  // Event Listeners for closing
  modal.querySelector("#close-modal-btn").addEventListener("click", closeModal);
  modal.addEventListener("click", (e) => {
    if (e.target === modal) closeModal(); // Close when clicking backdrop
  });
}
