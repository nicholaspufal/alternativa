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
  
  def result(student, exam)
    Assessment.find_result(student, exam) ? Assessment.find_result(student, exam).grade : 0.0
  end
  
end