require 'spec_helper'

describe Student do  
  describe "exams" do
    it "should be able to retrieve all the exams done" do  
      exam1 = FactoryGirl.create(:exam)    
      exam2 = FactoryGirl.create(:exam)    
      exam3 = FactoryGirl.create(:exam)    
      student = FactoryGirl.create(:student)
      
      Assessment.create(:student => student, :exam => exam1)
      Assessment.create(:student => student, :exam => exam2)
      
      student.exams_done.should eq([exam1,exam2])
    end    
  end
end