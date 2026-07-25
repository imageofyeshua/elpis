// Prevent uploading of big images.
document.addEventListener("DOMContentLoaded", function () {
  const imageUpload = document.querySelector("#micropost_image");
  if (!imageUpload) return;

  imageUpload.addEventListener("change", function() {
    const file = this.files[0];
    if (!file || !file.type.startsWith("image/")) return;

    const size_in_megabytes = file.size/1024/1024;
    if (size_in_megabytes > 2) {
      alert("File cannot be bigger than 2MB!")
      this.value = "";
    }

    const reader = new FileReader();
    reader.readAsDataURL(file);

    reader.onload = function (e) {
      const img = new Image();
      img.src = e.target.result;

      img.onload = function () {
        const targetWidth = 500;

        // Maintain original aspect ratio: scale height based on width change
        const scaleFactor = targetWidth / img.width;
        const targetHeight = img.height * scaleFactor;

        // Create canvas with 500px width and proportional height
        const canvas = document.createElement("canvas");
        canvas.width = targetWidth;
        canvas.height = targetHeight;

        const ctx = canvas.getContext("2d");
        ctx.drawImage(img, 0, 0, targetWidth, targetHeight);

        // Convert canvas back to a File object and update the file input
        canvas.toBlob(function (blob) {
          const resizedFile = new File([blob], file.name, {
            type: file.type,
            lastModified: Date.now()
          });

          const dataTransfer = new DataTransfer();
          dataTransfer.items.add(resizedFile);
          imageUpload.files = dataTransfer.files;
        }, file.type);
      };
    };
  });
});
