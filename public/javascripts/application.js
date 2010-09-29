// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
var Tracker = {
  init: function(){
    Tracker.TimeFrame.init();
  }
}

Tracker.TimeFrame = {
  init: function(){
    Tracker.TimeFrame.change_time_frame();
  },

  change_time_frame: function(){
    var selectedperiod = $("#time-frame select").attr("value");
    var projectId = $("#project_id").val();
    if (projectId) {
      $.getJSON("/projects/"+projectId, {timeframe: selectedperiod}, function(data){
        for(var i=0; i < data.participations.length; i++){
          if(data.max_time != 0){
            $("li[index='"+data.participations[i].id+"'] div.worker-chart")
                .width(25+(575.0*(data.participations[i].total_time_this_period/data.max_time)))
                .text(Math.round(data.participations[i].total_time_this_period / 36.0)/100);
          }else{
            $("li[index='"+data.participations[i].id+"'] div.worker-chart").width(18).text("0.0");;
          }
        }
      });
    }
  }
}

$(Tracker.init);
