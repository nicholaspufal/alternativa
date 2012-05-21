#encoding: utf-8

Dado /^que eu estou no formulário de cadastro de grupo$/ do
  visit new_admin_group_path
end

Dado /^que eu preenchi todos os campos requeridos para um grupo$/ do
  @name = "Engenharia de SW Manhã SENAC"
  fill_in "Nome", :with => @name
end

Dado /^que eu acessei o grupo "(.*)"$/ do |group_name|
  FactoryGirl.create(:group, :name => group_name)
  visit admin_groups_path
  click_link group_name
end

Dado /^que existem os alunos "(.*)", "(.*)" e "(.*)" cadastrados$/ do |student1, student2, student3|
  student_names = [student1, student2, student3]
  student_names.each { |student_name| FactoryGirl.create(:student, :name => student_name) }
end

Quando /^eu selecionar "(.*)" e "(.*)" e salvar$/ do |student1, student2|
  check student1
  check student2
  click_button "Salvar"
end

Quando /^eu acessar novamente o grupo "(.*)"$/ do |group_name|
  visit admin_groups_path
  click_link group_name
end

Então /^eu devo ver "(.*)" desmarcado$/ do |student_name|
  page.should have_unchecked_field(student_name)
end

Então /^eu devo ver o novo grupo na listagem$/ do
  visit admin_groups_path
  page.should have_content(@name)
end

Então /^eu devo ver "(.*)" e "(.*)" marcados$/ do |student1_name, student2_name|
  page.should have_checked_field(student1_name)
  page.should have_checked_field(student2_name)    
end