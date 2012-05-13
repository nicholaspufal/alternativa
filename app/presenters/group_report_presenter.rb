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
  
  def result(student, exam)
    Assessment.find_result(student, exam) ? Assessment.find_result(student, exam).grade : 0.0
  end
  
  def result_class(student, exam)
    if has_filter?
      result(student, exam) < filter_params ? "under_grade" : "over_grade"
    end
  end
  
  private
  
  def has_filter?
    h.params[:filter].present?
  end
  
  def filter_params
    h.params[:filter].to_f
  end
end