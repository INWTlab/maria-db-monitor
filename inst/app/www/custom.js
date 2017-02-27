$(function() {

    // Enables linking to specific tabs:
    if (window.location.hash){
      var hash = $.trim(window.location.hash);
      var tab = decodeURI(hash.substring(1, 100));
      $('a[data-value="'+tab+'"]').click();
    }
    // Usage: append the tabName to the URL after the hash.

});

$(function() {

    // Other code (e.g. the code above that enables linking to specific tabs)

    // Enables clicking on a kpi summary value box to view the time series:
    $('div[id^=indexOverviewBox]').click(function(){
        var parent_id = $(this).closest('div').attr('id');
        var parent_target = parent_id.replace('_summary_box', '');
        $('a[data-value=\"'+parent_target+'\"]').click();
    });

    // Visual feedback that the value box is now something you can click:
    $('div[id^=indexOverviewBox]').hover(function() {
        $(this).css('cursor','pointer');
    });

});
