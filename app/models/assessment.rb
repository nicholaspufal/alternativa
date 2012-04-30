class Assessment < ActiveRecord::Base
  belongs_to :exam
  belongs_to :student
  
  scope :answered_exam?, lambda { |student, exam| 
    joins(:student, :exam).where(:student_id => student, :exam_id => exam)
   }
end
