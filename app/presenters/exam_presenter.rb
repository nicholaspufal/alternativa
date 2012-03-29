#encoding: utf-8

class ExamPresenter < BasePresenter 
  presents :exam
  
  def title
    handle_presence exam.title do
      h.link_to(exam.title, h.exam_path(exam))
    end
  end
  
  def created_at
    "#{h.time_ago_in_words(exam.created_at)} atrás"
  end
  
end