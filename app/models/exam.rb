class Exam < ActiveRecord::Base
  has_many :questions, :dependent => :destroy
  # has_many :students, :through => :results
  has_many :assessments
  has_and_belongs_to_many :groups
  
  validates_presence_of :title, :start_time, :end_time
  validates_with ExamValidator
  
  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:title].blank? }, :allow_destroy => true
    
  scope :upcoming_exams, lambda { where("start_time > ?", Time.now) }
  
  scope :current_exams, lambda { where("start_time <= :time_now AND end_time >= :time_now", :time_now => Time.now) }
                
end