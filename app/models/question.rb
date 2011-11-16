# encoding: utf-8

class Question < ActiveRecord::Base
  belongs_to :exam
  has_many :answers, :dependent => :destroy
  accepts_nested_attributes_for :answers, :reject_if => lambda { |a| a[:title].blank? }, :allow_destroy => true
  
  before_validation :number_of_correct_answers
  
  protected 
  
  def number_of_correct_answers
     #if there is more than 2 answers marked as correct...
    if answers.select(&:correct?).count > 1
      errors.add(:base, "Apenas uma alternativa pode ser válida por questão.") 
    end
  end
  
end
