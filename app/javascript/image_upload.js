// Prevent uploading of big images.
document.addEventListener("DOMContentLoaded", function () {
  const imageUpload = document.querySelector("#micropost_image");
  imageUpload.addEventListener("change", function() {
    const size_in_megabytes = this.files[0].size;
    if (size_in_megabytes > 1) {
      alert("Maximum file size is 1MB. Please choose a smaller file.");
      this.value = "";
    }
  });
});
