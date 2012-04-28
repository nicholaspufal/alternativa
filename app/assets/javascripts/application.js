// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require jquery.ui.datepicker-pt-BR
//= require jquery-ui-timepicker-addon
//= require jquery-ui-timepicker-pt-BR
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
    $(link).closest(".control-group").fadeOut();  
}

function add_fields(link, association, content) {  
    var new_id = new Date().getTime();  
    var regexp = new RegExp("new_" + association, "g");  
    $(link).parent().parent().before(content.replace(regexp, new_id));  
}

$(document).ready(function() {
  
  //$.datepicker.setDefaults( $.datepicker.regional[ "pt-BR" ] );

	$(".datetimepicker").timepicker();

	$('.alert-message').alert();
});