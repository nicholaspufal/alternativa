#encoding: utf-8

Dado /^que eu possuo um aluno cadastrado no grupo ABC$/ do
  @student = FactoryGirl.create(:student)
  @student.groups.delete_all
  @student.groups << FactoryGirl.create(:group, :name => "ABC")
end

Dado /^eu acessei a página de edição de um aluno$/ do
  visit edit_admin_student_path(@student)
end

Dado /^eu desmarquei todos os grupos deste aluno e salvei as alterações$/ do
  uncheck("ABC")
  click_button("Salvar")
end

Dado /^que eu possuo o aluno "(.*)" recém cadastrado$/ do |student_name|
  FactoryGirl.create(:student, :name => student_name, :active => false)
end

Dado /^que eu possuo o aluno "(.*)" liberado$/ do |student_name|
  FactoryGirl.create(:student, :name => student_name, :active => true)
end

Quando /^eu clicar para liberar o acesso de "(.*)"$/ do |student_name|
  visit admin_students_path
  click_link "Liberar acesso"
end

Quando /^eu clicar para bloquear o acesso de "(.*)"$/ do |student_name|
  visit admin_students_path
  click_link "Bloquear acesso"
end

Quando /^eu visitar novamente a página de edição do aluno$/ do
  visit edit_admin_student_path(@student)
end

Então /^eu devo ver todos os grupos desmarcados$/ do
  page.should_not have_field("ABC", :checked => true)
end

Então /^eu devo ver o "(.*)" bloqueado$/ do |student_name|
  page.should have_content("Liberar acesso")
  page.should have_content("Não existem alunos ativos.")
end

Então /^eu devo ver o "(.*)" desbloqueado$/ do |student_name|
  page.should have_content("Bloquear acesso")
  page.should have_content("Não existem alunos pendentes.")
end







