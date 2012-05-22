require 'spec_helper'

describe Student do  
  context "exams" do
    before(:each) do
      @group = FactoryGirl.create(:group, :name => "ABC")
      
      @student = FactoryGirl.create(:student, :groups => [@group])
      
      @exam1 = FactoryGirl.create(:exam, 
                                  :title => "cba exam",
                                  :start_time => "20/05/2012 15:00", 
                                  :end_time => "20/05/2012 16:00",
                                  :groups => [@group])
                                            
      @exam2 = FactoryGirl.create(:exam,
                                  :title => "ABC exam",
                                  :start_time => "20/05/2012 15:30", 
                                  :end_time => "20/05/2012 16:30",
                                  :groups => [@group])
                                      
      @exam3 = FactoryGirl.create(:exam,
                                  :start_time => "12/05/2012 15:30", 
                                  :end_time => "12/05/2012 16:30")
    end
    
    it "should be able to retrieve all the exams done" do  
      Assessment.create(:student => @student, :exam => @exam1)
      Assessment.create(:student => @student, :exam => @exam2)
      
      @student.exams_done.should eq([@exam1,@exam2])
    end    
    
    it "should be able to retrieve the upcoming exams ordered alphabetically" do
      pretend_now_is(Time.parse("2012-04-25 14:50")) do 
        @student.upcoming_exams.should eq([@exam2, @exam1])
      end
    end
    
    it "should be able to retrieve the current exams ordered alphabetically" do
      exam4 = FactoryGirl.create(:exam,
                                 :title => "cba exam",
                                 :start_time => "20/05/2012 14:30", 
                                 :end_time => "20/05/2012 16:30",
                                 :groups => [@group])

      exam5 = FactoryGirl.create(:exam,
                                :start_time => "20/05/2012 12:00", 
                                :end_time => "20/05/2012 14:30",
                                :groups => [@group])

      exam6 = FactoryGirl.create(:exam,
                                :start_time => "20/05/2012 14:30", 
                                :end_time => "20/05/2012 16:30",
                                :groups => [@group])
                                
      exam7 = FactoryGirl.create(:exam,
                                 :title => "ABC exam",
                                 :start_time => "20/05/2012 11:30", 
                                 :end_time => "20/05/2012 16:30",
                                 :groups => [@group])
      
      FactoryGirl.create(:assessment, :exam => exam6, :student => @student)
      
      pretend_now_is(Time.parse("20/05/2012 14:50")) do 
        @student.current_exams.should eq([exam7, exam4])
      end
    end
    
    it "should filter by a specific group" do
      exam4 = FactoryGirl.create(:exam, :groups => [@group])
      @student.find_exams_where_group(@group).should eq([@exam1, @exam2, exam4])
    end
  end
  
  it "should have an API to change the status" do
    student = FactoryGirl.create(:student)
    student.active?.should eq(false)
  
    student.toggle_status
    student.active?.should eq(true)
  
    student.toggle_status
    student.active?.should eq(false)
  end
  
  it "should send an email to the administrator after the sign up proccess" do
    student = FactoryGirl.build(:student)
    AdminMailer.should_receive(:new_sign_up)
               .with(student)
               .and_return(double().as_null_object)
    student.save
  end
end
