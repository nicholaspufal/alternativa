#encoding: utf-8

Dado /^que eu estou no formulário de cadastro de grupo$/ do
  visit new_admin_group_path
end

Dado /^que eu preenchi todos os campos requeridos para um grupo$/ do
  @name = "Engenharia de SW Manhã SENAC"
  fill_in "Nome", :with => @name
end

Então /^eu devo ver o novo grupo na listagem$/ do
  visit admin_groups_path
  page.should have_content(@name)
end