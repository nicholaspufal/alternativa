class Admin::ExamsController < Admin::AdminController
  def index    
    @exams = Exam.find_all_for_user(current_user)
  end
end