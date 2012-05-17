# encoding: utf-8

Dado /^que eu estou no formulário de cadastro para uma nova avaliação$/ do
  visit new_admin_exam_path
end

Dado /^que eu preenchi todos os campos requeridos para uma avaliação$/ do
  fill_in "exam_title", :with => "Prova 1"
  
  fill_in "Data/hora início", :with => "18/04/2012 14:30"
  fill_in "Data/hora fim", :with => "18/04/2012 16:30"
  
  select "2.0", :from => "Peso da questão"
  
  fill_in "exam_questions_attributes_0_title", :with => "Qual a cor do cavalo branco de Napoleão?"
  
  fill_in "exam_questions_attributes_0_answers_attributes_0_title", :with => "Roxo"
  fill_in "exam_questions_attributes_0_answers_attributes_1_title", :with => "Branco"
  fill_in "exam_questions_attributes_0_answers_attributes_2_title", :with => "Vermelho"
  fill_in "exam_questions_attributes_0_answers_attributes_3_title", :with => "Cinza"
  
  find("button.control_correct_answer:first").click
end

Então /^eu devo ver os dados dessa nova avaliação$/ do
  page.should have_content "Prova 1"
  
  page.should have_content "Qual a cor do cavalo branco de Napoleão?"
  
  page.should have_content "Roxo"
  page.should have_content "Branco"
  page.should have_content "Vermelho"
  page.should have_content "Cinza"
end

Então /^a (.*) deve sumir$/ do |field|
  case field
    when "alternativa"
      find("input#exam_questions_attributes_0_answers_attributes_0_title").should_not be_visible
    when "questão"
      find("fieldset.question:first").should_not be_visible
  end
end

Então /^uma (.*) deve aparecer$/ do |field|
  case field
    when "nova questão"
      page.should have_css("fieldset.question", :count => 4)
    when "nova alternativa"
      page.should have_css(".hidden_correct", :count => 13)
  end
end


