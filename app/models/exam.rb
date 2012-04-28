class Exam < ActiveRecord::Base
  has_many :questions, :dependent => :destroy
  # has_many :students, :through => :results
  has_many :assessments
  has_and_belongs_to_many :groups
  
  DURATION_OPTIONS = (0.5..6).step(0.5).collect { |x| [x.to_s, x] }
  
  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:title].blank? }, :allow_destroy => true
  
  validates_presence_of :title
  validates_with ExamValidator  
end