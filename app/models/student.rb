class Student < User
  has_many :exams, :through => :results
  has_many :results
  
  has_and_belongs_to_many :groups
  
  validates_confirmation_of :password
  validates_presence_of :name, :email, :password, :password_confirmation
  
end
