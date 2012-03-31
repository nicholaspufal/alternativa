$(document).ready(function() {
  //paint the selected option - coming from the database
  $("input[type='hidden'].hidden_correct")
                          .filter(function(elem) { 
                                    return $(this).val() == "t" 
                                })
                          .siblings("button")
                          .addClass("correct_answer");

  //set to true the closest hidden input, and to false all other ones
  $("button.control_correct_answer").live("click", function () {
    parent = $(this).parents("fieldset.question")
    parent.find("input[type='hidden'].hidden_correct").val("f");
    parent.find("button.control_correct_answer").removeClass("correct_answer");

    $(this).toggleClass("correct_answer");
    $(this).siblings("input[type='hidden'].hidden_correct").val("t");
   });  
})
