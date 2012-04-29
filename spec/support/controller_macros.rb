module ControllerMacros
  def login_admin
    before(:each) do
      #@request.env["devise.mapping"] = Devise.mappings[:users]
      @teacher = FactoryGirl.create(:teacher)
      sign_in @teacher
    end
  end

  def login_user
    before(:each) do
      @student = FactoryGirl.create(:student)
      sign_in @student
    end
  end
end