// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
var Flux = {
  init: function(){
    Flux.Tools.replace_data_method_links();
  }
}

Flux.Tools = {
  replace_data_method_links: function(){
    $("a[data-method]").click(function(click_event){
      click_event.preventDefault();
      var method = $(this).attr('data-method') || "get";
      $.ajax({url: $(this).attr('href'), type: method, dataType: 'html', success: function(data){
        window.location.href = '/';
      }});
    });
  }
}

$(Flux.init);
