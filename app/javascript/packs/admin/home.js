
$("#product_image").bind("change", function(){
    var size_in_megabytes = this.files(0).size/1024/1024;
      if (size_in_megabytes > 1) {
        alert("Maximum file size is 1MB. Please choose an other file!");
      }
  });


$("#banner_image").bind("change", function(){
    var size_in_megabytes = this.files(0).size/1024/1024;
      if (size_in_megabytes > 1) {
        alert("Maximum file size is 1MB. Please choose an other file!");
      }
  });
$("#banner_image").onchange = (evt) => {
  alert( "Handler for .change() called." )
  // const file = $("#banner_image").files
  // if (file) {
  //   $("#blah").src = URL.createObjectURL(file[0])
  // }
}
