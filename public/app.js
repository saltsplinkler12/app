var currPage = 0; // PLAY HERE: set here current page (0 = home)

var $header = $('#header');
var $headerImg = $header.find('img');

$headerImg.eq( currPage ).show().addClass('currentImg');

// clone images to boxes:
var c = 0;
$('.box').each(function( i ){

  $(this).prepend( $headerImg.eq(i==currPage? (i+1+c++) : c+i).clone() );
});


$('.box img[class^=headImg]').on('mouseenter mouseleave', function( e ){

  var opacity = e.type=='mouseenter' ? 1 : 0 ;
  var myClass = $(this).prop('class'); // get class  
  var $mainImg = $header.find('img.'+myClass);


  $headerImg.hide();
  $mainImg.stop().fadeTo(300, opacity);
  $('.currentImg').stop().fadeTo(600, !opacity);


});