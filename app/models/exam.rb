class Exam < ActiveRecord::Base
  has_many :questions, :dependent => :destroy
  has_many :students, :through => :results
  has_many :results
  has_and_belongs_to_many :groups
  
  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:title].blank? }, :allow_destroy => true
  
  validates_presence_of :title
  validates_with ExamValidator
end