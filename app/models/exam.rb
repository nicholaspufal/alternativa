class Exam < ActiveRecord::Base
  has_many :questions, :dependent => :destroy
  # has_many :students, :through => :results
  has_many :assessments
  has_and_belongs_to_many :groups
  
  validates_presence_of :title, :duration, :start_time
  validates_with ExamValidator
  
  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:title].blank? }, :allow_destroy => true
    
  DURATION_OPTIONS = (0.5..6).step(0.5).collect { |x| [x.to_s, x] }
  
  scope :upcoming_exams, lambda { where("start_time > ?", Time.now) }
  
  scope :current_exams, lambda { where("start_time <= ? AND start_time > ?", Time.now, 6.hours.ago) }
end