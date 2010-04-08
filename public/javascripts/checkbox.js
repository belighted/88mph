$(document).ready(function() {

  // Pick up all checkboxes
  var checkbox = $(".checklist :checkbox");
  var checklabel = $(".checklist label");

  //hide original checkbox
  checkbox.hide();

  //Assign the right class
  checkbox.each(function(){
    if($(this).attr("checked") == true){
      $(this).parent().find("label").addClass("checkbox-selected");
    }else{
      $(this).parent().find("label").addClass("checkbox-deselected");
    };
  });

  //Change state on click
  checklabel.click(function() {
    if($(this).hasClass("checkbox-deselected")){
      $(this).removeClass("checkbox-deselected").addClass("checkbox-selected");
      $(this).parent().find(":checkbox").attr("checked") = true;
    }else if($(this).hasClass("checkbox-selected")){
      $(this).removeClass("checkbox-selected").addClass("checkbox-deselected");
      $(this).parent().find(":checkbox").attr("checked") = false;
    };
  });

  //Radio
  var radiobutton = $(".radiolist :radio");
  var radiolabel = $(".radiolist label");

  //Set radio display
  radiobutton.hide();
  radiolabel.css("cursor", "pointer");

  //Initialize state
  radiobutton.each(function(){
    if($(this).attr("checked") == true){
      $(this).parent().addClass("active-work");
    };
  });

  //Event function
  radiolabel.click(function() {
    $(this).parent().parent().find("li").removeClass("active-work");
    $(this).parent().addClass("active-work");
    $(this).parent().find(":radio").attr("checked") = true;
  });

  //Flash message

  $("#flash").hide().delay(200).slideDown(100).delay(4000).slideUp(200);

  //Select time frame
  var periodselector = $("#time-frame select");

  periodselector.change(function(){
    var selectedperiod = $(this).attr("value");
    var startperiod = $("#period_start");
    var endperiod = $("#period_end");

    switch (selectedperiod) {
      case "thisweek":
        alert(selectedperiod);
        startperiod.attr("value", "2010-04-05");
        endperiod.attr("value", "2010-04-09");
      break;
      case "lastweek":
        alert(selectedperiod);
        startperiod.attr("value", "2010-03-29");
        endperiod.attr("value", "2010-04-02");
      break;
      case "thismonth":
        alert(selectedperiod);
      break;
      case "lastmonth":
        alert(selectedperiod);
      break;
      case "thisyear":
        alert(selectedperiod);
      break;
      case "lastyear":
        alert(selectedperiod);
      break;
      default:
        startperiod.attr("value", "1900-01-01");
        endperiod.attr("value", "2100-01-01");
      break;
    };
  });

});