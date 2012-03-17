# encoding: utf-8

Dado /^que eu estou no formulário de cadastro para uma nova avaliação$/ do
  visit new_exam_path
end

Dado /^que eu preenchi todos os campos requeridos para uma avaliação$/ do
  fill_in "exam_title", :with => "Prova 1"
  
  fill_in "exam_questions_attributes_1_title", :with => "Qual a cor do cavalo branco de Napoleão?"
  
  fill_in "exam_questions_attributes_1_answers_attributes_0_title", :with => "Roxo"
  fill_in "exam_questions_attributes_1_answers_attributes_1_title", :with => "Branco"
  fill_in "exam_questions_attributes_1_answers_attributes_2_title", :with => "Vermelho"
  fill_in "exam_questions_attributes_1_answers_attributes_3_title", :with => "Cinza"
  
  check "exam_questions_attributes_1_answers_attributes_1_correct"
end

Então /^eu devo ver os dados dessa nova avaliação$/ do
  page.should have_content "Prova 1"
  
  page.should have_content "Qual a cor do cavalo branco de Napoleão?"
  
  page.should have_content "Roxo"
  page.should have_content "Branco"
  page.should have_content "Vermelho"
  page.should have_content "Cinza"
end

#Need to refactor. Bad xHTML markup :(
Então /^a (.*) deve sumir$/ do |field|
  case field
    when "alternativa"
      find("input#exam_questions_attributes_0_answers_attributes_0_title").should_not be_visible
    when "questão"
      find("fieldset.question:first").should_not be_visible
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


