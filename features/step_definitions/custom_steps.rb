# encoding: utf-8

Dado /^que eu estou na (.+)$/ do |page_name|
  visit path_to(page_name)
end

Quando /^eu clico "(.*)"$/ do |link|
  click_link(link)
end

Quando /^eu aperto "(.*)"$/ do |button|
  click_button(button)
end

Então /^eu devo ver "(.*)"$/ do |text|
  page.should have_content(text)
end

Quando /^eu preencho "(.*)" com "(.*)"$/ do |field, value|
  fill_in(field, :with => value)
end

Quando /^eu preencho o seguinte:$/ do |fields|
  fields.rows_hash.each do |name, value|
    fill_in(name, :with => value)
  end
end

#Need to refactor. Bad xHTML markup :(
Então /^a (.*) deve sumir$/ do |field|
  case field
    when "alternativa"
      find("input#exam_questions_attributes_0_answers_attributes_0_title").should_not be_visible
    when "questão"
      find("fieldset.question").should_not be_visible
  end
end

#Need to refactor. Bad xHTML markup :(
Então /^uma (.*) deve aparecer$/ do |field|
  case field
    when "Adicionar questão"
      page.should have_css("fieldset.question", :count => 4)
    when "Adicionar alternativa"
      page.should have_css("fieldset.question div.clearfix", :count => 9)
  end
end


