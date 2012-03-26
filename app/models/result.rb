class Result < ActiveRecord::Base
  belongs_to :exams
  belongs_to :students
end
