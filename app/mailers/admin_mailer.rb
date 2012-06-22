class AdminMailer < ActionMailer::Base
  default from: CONFIG['app_email'], 
          to: CONFIG['admin_email']
  
  def new_sign_up(student)
    @student = student
    mail(:subject => "Novo aluno cadastrado - #{student.name}")
  end
end
