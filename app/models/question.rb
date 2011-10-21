class Question < ActiveRecord::Base
  belongs_to :exam
  has_many :answers, :dependent => :destroy
  accepts_nested_attributes_for :answers, :reject_if => lambda { |a| a[:title].blank? }  
end
