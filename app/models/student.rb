class Student < User
  has_many :assessments
  has_and_belongs_to_many :groups
  has_many :exams, :through => :groups
  
  validates_presence_of :name
  
  attr_accessible :group_ids
  
  def exams_done
    assessments.collect(&:exam)
  end
  
  def find_exams_where_group(group)
    exams.select { |exam| exam.groups.include?(group) } 
  end
end
