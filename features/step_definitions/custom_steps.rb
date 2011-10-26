# encoding: utf-8

Então /^a (.*) deve sumir$/ do |field|
  case field
    when "alternativa"
      find("input#exam_questions_attributes_0_answers_attributes_0_title").should_not be_visible
    when "questão"
      find("fieldset.question:first").should_not be_visible
  end
end


