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
