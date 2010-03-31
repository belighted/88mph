$(document).ready(function() {

  // Pick up all checkboxes
  var checkbox = $(".checklist :checkbox");
  var checklabel = $(".checklist label");

  //hide original checkbox
  checkbox.hide();

  //Assign the right class
  checkbox.each(function(){
    if($(this).attr("checked") == false){
      $(this).parent().find("label").addClass("checkbox-deselected");
    }else if($(this).attr("checked") == true){
      $(this).parent().find("label").addClass("checkbox-selected");
    };
  });

  //Change state on click
  checklabel.click(function() {
    if($(this).hasClass("checkbox-deselected")){
      $(this).removeClass("checkbox-deselected").addClass("checkbox-selected");
      $(this).parent().find(":checkbox").attr("checked","checked");
    }else if($(this).hasClass("checkbox-selected")){
      $(this).removeClass("checkbox-selected").addClass("checkbox-deselected");
      $(this).parent().find(":checkbox").removeAttr("checked");
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
    $(this).parent().find(":radio").attr("checked","checked");
  });

});