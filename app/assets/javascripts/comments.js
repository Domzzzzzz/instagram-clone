// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

// function for toggling show more comments and show less comments
$(function(){
  $('.more-comments').click(function(e){
    e.preventDefault();
    var postId = $(this).data("post-id");
    $('#show-some-' + postId).addClass('hidden');
    $('#show-all-' + postId).removeClass('hidden');
  });

  $('.less-comments').click(function(e){
    e.preventDefault();
    var postId = $(this).data("post-id");
    $('#show-some-' + postId).removeClass('hidden');
    $('#show-all-' + postId).addClass('hidden');
  });
});
