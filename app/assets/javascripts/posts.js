// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


// function for changing the default/current img
// to the img uploaded into the new/edit post form
var loadFile = function(event) {
  var output = document.getElementById('image-preview');
  output.src = URL.createObjectURL(event.target.files[0]);
};
