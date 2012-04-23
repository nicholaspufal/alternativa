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

Quando /^eu clicar em "(.*)"$/ do |button_value|
  click_button button_value
end

Então /^eu devo ver a minha nota$/ do
  page.should have_content("Nota")
end

Então /^eu devo ver uma mensagem de parabéns$/ do
  page.should have_content("Parabéns!")
end