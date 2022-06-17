document.addEventListener("turbolinks:load", function() {
  function preview_img (input, output) {
    let select = document.getElementById(input);
    select.addEventListener('change', function (){
      if (this.files) {
        document.getElementById(output).src = URL.createObjectURL(this.files[0])
      }
    })
  }

  preview_img('banner_image', 'js-img-preview')
});