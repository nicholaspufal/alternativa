class Group < ActiveRecord::Base
  has_and_belongs_to_many :students
  has_and_belongs_to_many :exams
  
  validates_presence_of :name
end
