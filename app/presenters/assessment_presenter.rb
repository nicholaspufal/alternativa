#encoding: utf-8

class AssessmentPresenter < BasePresenter 
  presents :exam
  
  def title
    handle_presence exam.title do
      h.link_to(exam.title, h.new_exam_assessment_path(exam))
    end
  end
  
  def created_at
    "#{h.time_ago_in_words(exam.created_at)} atrás"
  end
  
  def start_time
    brazilian_datetime_format(exam.start_time)
  end
  
  def end_time
    brazilian_datetime_format(exam.end_time)
  end
  
end