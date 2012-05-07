class Assessment < ActiveRecord::Base
  belongs_to :exam
  belongs_to :student
  
  def self.find_result(student, exam)
    joins(:student, :exam).where(:student_id => student, :exam_id => exam).pop
  end
end
