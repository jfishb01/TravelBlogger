// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require jquery.cookie
//= require underscore
//= require gmaps/google
//= require prettyphoto-rails
//= require_tree .


$(document).ready( function() {
  $(document).mousemove(function(e){
    var y_pos = e.pageY;

    if(y_pos >= $(window).height() - 20) {
        $(".debug_dump" ).css("visibility", "visible");
    } else {
        $(".debug_dump" ).css("visibility", "hidden");
    }
  });
});

