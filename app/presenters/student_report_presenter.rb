#encoding: utf-8

class StudentReportPresenter < BasePresenter 
  presents :student
  
  def name
    handle_presence student.name do
      h.link_to(student.name, h.admin_student_report_path(student))
    end
  end
  
  def name_show
    handle_presence student.name
  end
  
  def group_name(group)
    handle_presence group.name
  end
  
  def exam_title(exam)
    handle_presence exam.title 
  end
  
  def show_result(exam)
    if result = result(student,exam)
      result
    else
      h.content_tag :span, "N/R", :class => "hover_me", :"data-content" => "O aluno ainda não realizou esta prova.", :"data-original-title" => "Não realizada (N/R)"
    end
  end
  
  def has_assessments?
    student.exams.present? && student.groups.present?
  end
  
  private
  
  def result(student, exam)
    if assessment = Assessment.find_result(student, exam)
      assessment.grade 
    end
  end
  
end