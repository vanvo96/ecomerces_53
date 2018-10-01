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
    $('.clickdn').removeClass('background-on');
    $('.clickdk').addClass('background-on');
    $('.clickdk').removeClass('background-off');
  });

  $('.clickdn').click(function(){
    $('.signup').hide();
    $('.loginn').show();
    $('.clickdn').addClass('background-on');
    $('.clickdn').removeClass('background-off');
    $('.clickdk').addClass('background-off');
    $('.clickdk').removeClass('background-on');
  });

  $('.x').click(function(){
    $('.dklogin').hide();
  });

  $('.dk').click(function(){
    $('.loginn').hide();
    $('.signup').show();
    $('.clickdk').addClass('background-on');
    $('.clickdk').removeClass('background-off');
    $('.clickdn').addClass('background-off');
    $('.clickdn').removeClass('background-on');
  });

  $('.if_check label').click(function(){
    $('.checked').show();
  });

  $(".btn-show-form").click(function(){
    $(".form-checkout").show();
  });

  $(".form-checkout").mouseleave(function(){
    $("body").dblclick(function(){
      $(".form-checkout").hide();
    })
  });

  $(".or-login").click(function(){
    $(".form-checkout").hide();
    $('.dklogin').show()
    $('.clickdn').addClass('background-on');
    $('.clickdk').addClass('background-off');
  })
});
