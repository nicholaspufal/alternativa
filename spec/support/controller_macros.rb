module ControllerMacros
  def login_admin
    before(:each) do
      #@request.env["devise.mapping"] = Devise.mappings[:users]
      @teacher = FactoryGirl.create(:teacher, :active => true)
      sign_in @teacher
    end
  end

  def login_user
    before(:each) do
      @student = FactoryGirl.create(:student, :active => true)
      sign_in @student
    end
  end
end