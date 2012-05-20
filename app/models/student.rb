class Student < User
  has_many :assessments
  has_and_belongs_to_many :groups
  has_many :exams, :through => :groups
  after_create :send_mail
  
  default_scope :order => "lower(name) ASC"
  
  validates_presence_of :name
  
  attr_accessible :group_ids
  
  scope :active_students, where(:active => true)  
  scope :pending_students, where(:active => false)
  
  def toggle_status
    toggle!(:active)
  end
  
  def exams_done
    assessments.collect(&:exam)
  end
  
  def find_exams_where_group(group)
    exams.select { |exam| exam.groups.include?(group) } 
  end
  
  protected
  
  def send_mail
    AdminMailer.new_sign_up(self).deliver
  end
end
