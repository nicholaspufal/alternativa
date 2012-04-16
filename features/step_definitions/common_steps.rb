#encoding: utf-8

Dado /^que eu sou um aluno e realizei login$/ do
  email = 'joaozinho@gmail.com'
  password = '123456'
  Student.new(:email => email, :name => "Joãozinho", :password => password, :password_confirmation => password).save!

  visit root_path
  fill_in "E-mail", :with => email
  fill_in "Senha", :with => password
  click_button "login"
end

Dado /^que eu sou um administrador e realizei login$/ do  
  email = 'profpardal@gmail.com'
  password = '123456'
  Teacher.new(:email => email, :password => password, :password_confirmation => password).save!

  visit admin_root_path
  fill_in "E-mail", :with => email
  fill_in "Senha", :with => password
  click_button "login"
end


Quando /^eu clico "(.*)"$/ do |value|
  begin
    click_button value
  rescue 
    click_link value
  end
end