#encoding: utf-8

Dado /^que eu sou o aluno "(.*)", estou no grupo "(.*)" e realizei login$/ do |student_name, group_name|
  email = 'joaozinho@gmail.com'
  password = '123456'
  student = FactoryGirl.create( :student, 
                                :email => email, 
                                :name => student_name, 
                                :password => password, 
                                :password_confirmation => password, 
                                :active => true )
                                
  student.groups << FactoryGirl.create(:group, :name => group_name)
  
  visit root_path
  fill_in "E-mail", :with => email
  fill_in "Senha", :with => password
  click_button "login"
end

Dado /^que existe a avaliação "(.*)" disponível ao grupo "(.*)" em execução$/ do |exam_title, group_name|
  exam = FactoryGirl.create(:exam, :title => exam_title, :start_time => Time.now, :end_time => Time.now + 3.hours)
  exam.groups << Group.find_or_create_by_name(group_name)
  exam.save!
end

Dado /^que eu sou um administrador e realizei login$/ do  
  email = 'profpardal@gmail.com'
  password = '123456'
  
  FactoryGirl.create( :teacher,
                      :email => email, 
                      :password => password, 
                      :password_confirmation => password, 
                      :active => true )
  
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