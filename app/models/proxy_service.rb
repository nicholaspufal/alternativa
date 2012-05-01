class ProxyService
  def self.check_permission(student, exam)
    (student.groups & exam.groups).any?
  end
  
  def self.check_availability(student, exam)
    student.exams.current_exams.include? exam
  end
  
  def self.check_first_time(student, exam)
    Assessment.answered_exam?(student, exam).empty?
  end
  
  def self.check_time_remaining(exam)
    Time.now <= exam.end_time
  end
end