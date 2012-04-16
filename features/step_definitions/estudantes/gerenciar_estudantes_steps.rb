#encoding: utf-8

Dado /^que eu possuo um aluno cadastrado no grupo ABC$/ do
  @student = FactoryGirl.create(:student)
end

Dado /^eu acessei a página de edição de um aluno$/ do
  visit edit_admin_student_path(@student)
end

Dado /^eu desmarquei todos os grupos deste aluno e salvei as alterações$/ do
  uncheck("Meu grupo de teste 1")
  click_button("Salvar")
end

Quando /^eu visitar novamente a página de edição do aluno$/ do
  visit edit_admin_student_path(@student)
end

Então /^eu devo ver todos os grupos desmarcados$/ do
  true
end






