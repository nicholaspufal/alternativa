# encoding: utf-8

class Question < ActiveRecord::Base
  belongs_to :exam
  has_many :answers, :dependent => :destroy
  
  QUESTION_WEIGHTS = (0.5..5).step(0.5)
  
  validates_presence_of :weight
  validates_with QuestionValidator
  accepts_nested_attributes_for :answers, :reject_if => lambda { |a| a[:title].blank? }, :allow_destroy => true
end
