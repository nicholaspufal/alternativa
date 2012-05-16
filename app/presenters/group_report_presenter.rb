#encoding: utf-8

class GroupReportPresenter < BasePresenter 
  presents :group
  
  def name
    handle_presence group.name do
      h.link_to(group.name, h.admin_group_report_path(group))
    end
  end
  
  def name_show
    handle_presence group.name
  end
  
  def exam_title(exam)
    handle_presence exam.title 
  end
  
  def student_name(student)
    handle_presence student.name do
      h.link_to student.name, h.admin_student_report_path(student), :target => "_blank"
    end
  end
  
  def show_result(student, exam)
    if result = result(student,exam)
      result
    else
      h.content_tag :span, "N/R", :class => "hover_me", :"data-content" => "O aluno ainda não realizou esta prova.", :"data-original-title" => "Não realizada (N/R)"
    end
  end
  
  def result_class(student, exam)
    if has_filter?
      if result = result(student,exam)
        if result < filter_params
          "under_grade"
        else
          "over_grade"
        end
      end
    end
  end
  
  def has_assessments?
    group.exams.present? && group.students.present?
  end
  
  private
  
  def has_filter?
    h.params[:filter].present?
  end
  
  def filter_params
    h.params[:filter].to_f
  end
  
  def result(student, exam)
    if assessment = Assessment.find_result(student, exam)
      assessment.grade 
    end
  end
end