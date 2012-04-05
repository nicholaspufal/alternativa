class Teacher < User
  before_save :default_to_admin
  
  private
  
  def default_to_admin
    write_attribute(:admin, true)
  end
end