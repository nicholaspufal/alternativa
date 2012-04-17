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
      @student = Factory.create(:student)
      @student.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the confirmable module
      sign_in @student
    end
  end
end