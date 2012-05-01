module AssessmentsHelper
  def show_counter(exam)
    timeleft = exam.end_time - Time.now
    timeleft = (timeleft / 60).round
    timeleft < 0 ? "Tempo esgotado" : "Restam #{timeleft} minuto(s)"    
  end 
end