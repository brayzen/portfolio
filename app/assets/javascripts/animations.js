//$(function(){
//  var answers = ['You like that mug shot?', 'Oh, you really do', 'Woa', 'Okay now its just Creepy', 'Creeper']
//  var $mypic = $('#mypic');
//  var count = 0;
//  //Scroll animiations
//  $(window).on('scroll', function(){
//    var $scrollTop = $(this).scrollTop();
//    if ($scrollTop > 230){
//      $mypic.addClass('rotate');
//    } else if ($scrollTop < 229) {
//      $mypic.removeClass('rotate');
//    }
//  });
//
//  //MOUSEOVER animations
//  $mypic.mouseover(function(){
//    var $speakerbox = $('#speakerbox');
//    $speakerbox.stop().css('display', 'block').css('opacity', '1');
//    count++;
//    console.log('this is the count: ' + count);
//    if (count >= 5) {
//      $speakerbox.text(answers[4]).fadeOut(3000).css('display', 'block');
//    } else {
//      $speakerbox.text(answers[count - 1]).fadeOut(3000).css('display', 'block');
//    }
//  });
//})
