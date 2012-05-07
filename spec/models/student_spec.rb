require 'spec_helper'

describe Student do  
  describe "exams" do
    before(:each) do
      @group = FactoryGirl.create(:group, :name => "ABC")
      
      @student = FactoryGirl.create(:student)
      @student.groups << @group
      
      @exam1 = FactoryGirl.create(:exam)
      @exam1.groups << @group
          
      @exam2 = FactoryGirl.create(:exam)    
      @exam2.groups << @group
      
      @exam3 = FactoryGirl.create(:exam)
    end
    
    it "should be able to retrieve all the exams done" do  
      Assessment.create(:student => @student, :exam => @exam1)
      Assessment.create(:student => @student, :exam => @exam2)
      
      @student.exams_done.should eq([@exam1,@exam2])
    end    
    
    it "should filter by a specific group" do
      @exam4 = FactoryGirl.create(:exam)
      @exam4.groups << @group  
                
      @student.find_exams_where_group(@group).should eq([@exam1, @exam2, @exam4])
    end
  end
end
