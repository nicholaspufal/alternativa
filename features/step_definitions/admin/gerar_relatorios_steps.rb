#encoding: utf-8 

Dado /^que existem avaliações já respondidas por alunos$/ do  
  group = FactoryGirl.create(:group, :name => "Grupo da faculdade") 
  
  exam1 = FactoryGirl.create(:exam, :title => "Prova 1") 
  exam2 = FactoryGirl.create(:exam, :title => "Prova 2")
  exam1.groups << group
  exam2.groups << group 
  
  3.times do |number|
    number = number + 1
    
    student = FactoryGirl.create(:student, :email => "fulano#{number}@gmail.com")
    student.groups << group
    
    FactoryGirl.create(:assessment, :student => student, :exam => exam1)
    FactoryGirl.create(:assessment, :student => student, :exam => exam2)
  end
end

Dado /^que eu acessei os relatórios de um grupo$/ do
  visit admin_groups_reports_path
  click_link "Grupo da faculdade"
end

Dado /^que eu acessei os relatórios de um aluno$/ do
  visit admin_students_reports_path
  click_link Student.last.name
end

Então /^eu devo ver todas as avaliações daquele grupo listadas$/ do
  Group.first.exams.each do |exam|
    page.should have_css("table thead tr th", :text => exam.title) 
  end
end

Então /^eu devo ver a nota de cada aluno em cada uma das avaliações$/ do
  Assessment.all.each do |assessment|
    page.should have_css("table tbody tr td", :text => assessment.grade.to_s)
    page.should have_css("table tbody tr td", :text => assessment.student.name) 
  end
end

Então /^eu devo ver todas as avaliações daquele aluno listadas$/ do
  Student.last.exams.each do |exam|
    page.should have_css("table tbody tr td", :text => exam.title)
  end
end

Então /^eu devo ver a nota de cada uma de suas avaliações$/ do
  Student.last.assessments.each do |assessment|
    page.should have_css("table tbody tr td", :text => assessment.grade.to_s)
  end
end