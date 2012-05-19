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

Quando /^eu visitar novamente a página de edição do aluno$/ do
  visit edit_admin_student_path(@student)
end

Então /^eu devo ver todos os grupos desmarcados$/ do
  page.should_not have_field("ABC", :checked => true)
end






