class StudentPresenter < BasePresenter 
  presents :student
  
  handle_presence_of :email, :password
  
  def name
    handle_presence student.name do
      h.link_to(student.name, h.student_path(student))
    end
  end
  
end