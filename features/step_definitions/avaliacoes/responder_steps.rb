#encoding: utf-8

Dado /^que eu entrei em uma avaliação em execução$/ do
  true
end

Dado /^que eu respondi toda ela de acordo com o meu conhecimento$/ do
  true
end

Quando /^eu clicar em "([^"]*)"$/ do |arg1|
  true
end

Então /^eu devo ver a minha nota$/ do
  true
end

Dado /^que eu respondi toda ela corretamente$/ do
  true
end

Então /^eu devo ver uma mensagem de parabéns$/ do
  true
end

Então /^a minha nota deve ser (\d+)$/ do |arg1|
  true
end