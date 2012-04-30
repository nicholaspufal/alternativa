require 'spec_helper'

describe ProxyService do
  context "permissions" do
    before(:each) do
      @group = FactoryGirl.create(:group)
      @current_user = FactoryGirl.create(:student)
      @exam = FactoryGirl.create(:exam)
      @exam.groups << @group
    end
    
    it "should check if a given student have permission to a given exam" do      
      ProxyService.check_permission(@current_user, @exam).should eq(false)
      @current_user.groups << @group
      ProxyService.check_permission(@current_user, @exam).should eq(true)
    end  
    
    it "should check if a given student is trying to enter the given exam on the right start time" do
      @current_user.groups << @group
      
      pretend_now_is(Time.parse("2012-04-28 15:30")) do 
        @exam.update_attribute(:start_time, Time.parse("2012-04-28 09:29"))
        ProxyService.check_availability(@current_user, @exam).should eq(false)
        
        @exam.update_attribute(:start_time, Time.parse("2012-04-29 15:30"))
        ProxyService.check_availability(@current_user, @exam).should eq(false)
        
        @exam.update_attribute(:start_time, Time.parse("2012-04-27 15:30"))
        ProxyService.check_availability(@current_user, @exam).should eq(false)
        
        @exam.update_attribute(:start_time, Time.parse("2012-04-28 15:29"))
        ProxyService.check_availability(@current_user, @exam).should eq(true)
      end
    end
    
    it "should check if it's the first time the user is trying to answer an exam" do
      @current_user.groups << @group
      
      ProxyService.check_first_time(@current_user, @exam).should eq(true)
      
      FactoryGirl.create(:assessment, :student => @current_user, :exam => @exam)
      
      ProxyService.check_first_time(@current_user, @exam).should eq(false)
    end
  end
end