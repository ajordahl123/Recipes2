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