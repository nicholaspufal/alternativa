# encoding: utf-8

FactoryGirl.define do
  factory :exam do
    title 'Primeira prova'
    questions {|q| [q.association(:question)]}
  end
  
  factory :question do
    title 'Alguma questão'
    answers {|a| [a.association(:answer)]}
  end
  
  factory :answer do
    title 'Alguma resposta'
  end
  
end