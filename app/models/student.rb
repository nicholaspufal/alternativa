class Student < User
  # has_many :exams, :through => :results
  has_many :assessments
  has_and_belongs_to_many :groups
  has_many :exams, :through => :groups
  
  
  validates_presence_of :name, :email
  
  attr_accessible :group_ids
  
  def exams_done
    assessments.collect(&:exam)
  end
end
