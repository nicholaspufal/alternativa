class AdminMailer < ActionMailer::Base
  default from: "alternativaprovasobjetivas@gmail.com", 
          to: ADMIN_CONFIG['admin_notifications_email']
  
  def new_sign_up(student)
    @student = student
    mail(:subject => "Novo aluno cadastrado - #{student.name}")
  end
end
