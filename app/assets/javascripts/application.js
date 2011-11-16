// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .

function remove_question(link) {	
		$(link).closest("fieldset.question")
					 .children(".clearfix:first")
					 .children("div.input")
					 .children("input:hidden")
					 .val("1");
					
    $(link).closest("fieldset.question").fadeOut();  
}

function remove_field(link) {
		$(link).prevAll("input:hidden").val("1");  
    $(link).closest(".clearfix").fadeOut();  
}

function add_fields(link, association, content) {  
    var new_id = new Date().getTime();  
    var regexp = new RegExp("new_" + association, "g");  
    $(link).parent().parent().before(content.replace(regexp, new_id));  
}

$(document).ready(function() {
	
	//paint the selected option - coming from the database
	$('.add-on [type=checkbox]:checked').parent().addClass('active');

	$('.alert-message').alert();

	//in order to avoid issues with radio buttons, solution was to simulate radio behavior with checkboxes...
	$('.add-on :checkbox').live("click", function () {		
		$(this).parents("fieldset").find(".add-on [type=checkbox]").removeAttr("checked");
		$(this).parents("fieldset").find(".add-on [type=checkbox]").parent().removeClass("active");
	
		$(this).attr("checked","checked");		
		$(this).parent().addClass("active");
	 });
		
});
