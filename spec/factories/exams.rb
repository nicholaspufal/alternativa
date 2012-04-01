# encoding: utf-8

FactoryGirl.define do
  factory :exam do
    title 'Primeira prova'
    
    after_build do |exam| 
      exam.questions << FactoryGirl.create(:question)
    end
  end
  
  factory :question do
    title 'Alguma questão'
    weight 2.0

    after_build do |question| 
      answer = FactoryGirl.create(:answer, :correct => true)
      question.answers << answer
      
      3.times { question.answers << FactoryGirl.create(:answer) }
    end
  end
  
  factory :question_with_no_answers, :class => Question do
    title "Alguma questão"
  end
  
  factory :answer do
    title 'Alguma resposta'
  end
  
end