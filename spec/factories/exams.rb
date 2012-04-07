# encoding: utf-8

FactoryGirl.define do
  factory :exam do
    title 'Primeira prova'
    
    #creating 4 questions for this exam
    after_build do |exam| 
      4.times { exam.questions << FactoryGirl.create(:question) }
    end
  end
  
  factory :question do
    title 'Alguma questão'
    weight 2.0

    after_build do |question| 
      answer = FactoryGirl.create(:answer, :correct => true, :title => "resposta certa")
      question.answers << answer
      3.times { question.answers << FactoryGirl.create(:answer) }
    end
    
  end
  
  factory :question_with_no_answers, :class => Question do
    title "Alguma questão"
  end
  
  factory :answer do
    title 'alguma resposta errada'
    correct false
  end
  
end