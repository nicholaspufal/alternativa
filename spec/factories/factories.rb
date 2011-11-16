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
  
  factory :question_with_multiple_correct, :parent => :question do
    answers do
      2.times.collect { Factory(:correct_answer) }
    end  
  end

  factory :correct_answer, :parent => :answer do
    correct true
  end
  
end