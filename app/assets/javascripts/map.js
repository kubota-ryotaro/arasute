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
