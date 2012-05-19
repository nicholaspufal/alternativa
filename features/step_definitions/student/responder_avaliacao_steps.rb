#encoding: utf-8

Dado /^que eu entrei na avaliação "(.*)"$/ do |exam_title|
  visit root_path
  click_link(exam_title)
end

Dado /^que eu respondi toda ela de acordo com o meu conhecimento$/ do
  choose("answers__0_alguma_resposta_errada")
  choose("answers__1_resposta_certa")
  choose("answers__2_resposta_certa")
  choose("answers__3_alguma_resposta_errada")
end

Dado /^que eu respondi toda ela corretamente$/ do
  choose("answers__0_resposta_certa")
  choose("answers__1_resposta_certa")
  choose("answers__2_resposta_certa")
  choose("answers__3_resposta_certa")
end

Dado /^que eu errei a primeira e a última questão$/ do
  choose("answers__0_alguma_resposta_errada")
  choose("answers__1_resposta_certa")
  choose("answers__2_resposta_certa")
  choose("answers__3_alguma_resposta_errada")
end

Dado /^que eu não marquei nenhuma resposta$/ do
end

Quando /^eu clicar em "(.*)"$/ do |button_value|
  click_button button_value
end

Então /^eu devo ver a minha nota$/ do
  page.should have_content("Nota")
end

Então /^eu devo ver uma mensagem de parabéns$/ do
  page.should have_content("Parabéns!")
end

Então /^eu devo ver as respostas certas para a primeira e a última questões$/ do
  page.should have_css("table#wrong_questions tr", :count => 3)
end

Então /^eu devo ver a segunda e a terceira questões listadas como corretas$/ do
  page.should have_css("table#correct_questions tr", :count => 3)
end

Então /^eu devo ver uma mensagem informando que ao menos uma questão deve ser respondida$/ do
  page.should have_content("precisa responder ao menos uma questão")
end
