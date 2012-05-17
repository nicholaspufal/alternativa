#encoding: utf-8

Dado /^que não existe nenhuma avaliação realizada por mim$/ do
  Assessment.delete_all
end

Dado /^que a minha nota na avaliação "([^"]*)" foi "([^"]*)"$/ do |exam_name, exam_grade|
  student = Student.last
  exam = FactoryGirl.create(:exam, :title => exam_name)
  exam.groups << student.groups.last
  
  FactoryGirl.create(:assessment, 
                     :grade => exam_grade, 
                     :exam => exam, 
                     :student => student)
                                  
end

Quando /^eu visitar a área de resultados$/ do
  visit results_path
end

Então /^eu devo ver as notas "(.*)" e "(.*)" dentro do grupo "(.*)"$/ do |grade1, grade2, group_name|
  page.should have_content group_name
  page.should have_content grade1
  page.should have_content grade2
end

Então /^eu devo ver uma mensagem de "(.*)"$/ do |message|
  page.should have_content message
end

