$(document).ready(function(){
  $('.boxmodal').click(function(){
    $('.dklogin').show();
    $('.clickdn').addClass('background-on');
    $('.clickdk').addClass('background-off');
  });

  $('.clickdk').click(function(){
    $('.loginn').hide();
    $('.signup').show();
    $('.clickdn').addClass('background-off');
    $('.clickdk').addClass('background-on');
  });

  $('.clickdn').click(function(){
    $('.signup').hide();
    $('.loginn').show();
    $('.clickdn').addClass('background-on');
    $('.clickdk').addClass('background-off');
  });

  $('.x').click(function(){
    $('.dklogin').hide();
  });

  $('.dk').click(function(){
    $('.loginn').hide();
    $('.signup').show();
    $('.clickdk').addClass('background-on');
    $('.clickdn').addClass('background-off');
  });

});
