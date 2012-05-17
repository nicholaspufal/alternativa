#encoding: utf-8

class StudentPresenter < BasePresenter 
  presents :student
  
  handle_presence_of :email, :password
  
  def name
    handle_presence student.name do
      h.link_to(student.name, h.edit_admin_student_path(student))
    end
  end
  
  def toggle_access
    if student.active?
      text = "Bloquear acesso"
      html_class = "btn-danger"      
    else
      text = "Liberar acesso"
      html_class = "btn-success" 
    end
    
    h.link_to text, h.admin_student_toggle_status_path(student), :method => :put, :class => "btn #{html_class}"
  end
  
end