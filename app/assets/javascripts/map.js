jQuery(function($) {
  jQuery("#search").multiselect({
    header: true,
    noneSelectedText: "駅の選択",
    selectedText:"# 個選択",
    selectedList: 3,
    autoopen:true,
    multiple:true
  });
});

jQuery(function($) {
  jQuery("#category").multiselect({
    header: true,
    noneSelectedText: "ジャンル選択",
    selectedList: 4,
    autoopen:true,
    multiple:true
  });
});

$(function () {
  var $body = $('body');
  $('#js__sideMenuBtn').on('click', function () {
    $body.toggleClass('side-open');
    $('#js__overlay').on('click', function () {
      $body.removeClass('side-open');
    });
  });
});

$('#js__sideMenuBtn').click(function() {
  //$('#hamburger-bar').fadeOut(2000);
  element.parentNode.removeChild(element);
 });
