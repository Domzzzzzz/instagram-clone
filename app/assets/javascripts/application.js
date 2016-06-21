// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require jquery.turbolinks
//= require turbolinks
//= require_tree .


// function for infinite scrolling
// gets triggered when user scrolls the window
// checks if user has scrolled near bottom of page
// replaces pagination link with loading animation
// then gets the next page of the pagination
$(function() {
  $(window).scroll(function(){
    var url = $('.pagination .next_page').attr('href');
    if(url && $(window).scrollTop() > $(document).height() - $(window).height() - 50){
      $('.pagination').html('<i class="fa fa-spinner fa-pulse fa-3x fa-fw"></i>');
      $.getScript(url);
    }
  });
});

// function that adds 'comments_<%= @post.id %>' to the modal once opened
// this enables the modal to use AJAX response to create/delete comments
$(function(){
  $('#myModal2').on('show.bs.modal', function(){
    $('.modal-body').attr('id', 'comments_<%= @post.id %>');
  });
});
