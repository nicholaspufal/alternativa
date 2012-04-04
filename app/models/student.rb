class Student < User
  has_many :exams, :through => :results
  has_many :results
  has_and_belongs_to_many :groups
  
  validates_presence_of :name, :email
end
