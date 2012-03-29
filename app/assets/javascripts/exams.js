$(document).ready(function() {
  //paint the selected option - coming from the database
  $('.add-on [type=checkbox]:checked').parent().addClass('active');

  //in order to avoid issues with radio buttons, solution was to simulate radio behavior with checkboxes...
  $('.add-on :checkbox').live("click", function () {	
    console.log("working");

  	$(this).parents("fieldset").find(".add-on [type=checkbox]").removeAttr("checked");
  	$(this).parents("fieldset").find(".add-on [type=checkbox]").parent().removeClass("active");

  	$(this).attr("checked","checked");		
  	$(this).parent().addClass("active");
   });  
})
