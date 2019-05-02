// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require activestorage
//= require turbolinks
//= require_tree .


jQuery(function() {

  if (hidden == null) {
    $("#filter_wrap").hide();
    var hidden = true;
  }

  $("#filter_wrap_toggle").click(function() {

    $("#filter_wrap").toggle();

    if (hidden) {
      $("#filter_wrap_toggle").html("Hide Filter");
      $("#filter_wrap").show();
      hidden = false;
    }
    else {
      $("#filter_wrap_toggle").text("Expand Filter");
      $("#filter_wrap").hide();
      hidden = true;
    }
  });
});

jQuery(function() {
  $("#funmode").click(function() {

    $("body").css("background-image", "url(/assets/guy-fieiri-flame.jpg)");
    $("audio")[0].play();
    alert("Hey everybody I'm Guy Fieri and we're rolling out looking for America's greatest Diners, Drive Ins and Dives!");
    $(".table").hide()
    $('h1').removeClass('header').addClass('diablo');
    $('h2').removeClass('header').addClass('diablo');
    $('h3').addClass('diablo').text("We're takin' you on a road rockin' trip down to Flavortown, where the gravitational force of bacon warps the laws of space and time.");
    console.log("congratulations");

  });
});
