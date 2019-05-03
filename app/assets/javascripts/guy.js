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