require 'spec_helper'
require 'ostruct'

describe AssessmentsController do
  
  login_user
  
  before(:each) do
    @group = FactoryGirl.create(:group)
    @exam = FactoryGirl.create(:exam)
    @exam.groups << @group
    @student.groups << FactoryGirl.create(:group, :name => "Another group")    
  end
  
  describe "GET new" do
    it "should raise an error when the student tries to access some exam without access to it" do  

      expect {
         get :new, { :exam_id => @exam.id }
      }.to raise_error("No permission")      
    end
    
    it "should raise an error when the student access an exam not yet opened" do
      pretend_now_is(Time.parse("2012-04-28 15:30")) do 
        @exam.update_attribute(:start_time, "2012-04-29 15:40")
        @student.groups << @group

        expect {
           get :new, { :exam_id => @exam.id }
        }.to raise_error("Not available")
      end
    end
  end
  
  describe "POST create" do
    it "should raise an error when the student tries to access some exam without access to it" do
      @student.groups << FactoryGirl.create(:group, :name => "Another group")      
      expect {
         post :create, { :exam_id => @exam.id }
      }.to raise_error("No permission")      
    end
    
    it "should raise an error when the student access an exam not yet opened" do
      pretend_now_is(Time.parse("2012-04-28 15:30")) do 
        @exam.update_attribute(:start_time, "2012-04-29 15:40")
        @student.groups << @group

        expect {
           post :create, { :exam_id => @exam.id }
        }.to raise_error("Not available")
      end
    end
  end
  
  describe "GET show" do
    it "should raise an error when the student tries to access some exam without access to it" do   
      @student.groups << FactoryGirl.create(:group, :name => "Another group")   
      expect {
         get :show, { :exam_id => @exam.id }
      }.to raise_error("No permission")      
    end
    
    it "should raise an error when the student access an exam not yet opened" do
      pretend_now_is(Time.parse("2012-04-28 15:30")) do 
        @exam.update_attribute(:start_time, "2012-04-29 15:40")
        @student.groups << @group

        expect {
           get :show, { :exam_id => @exam.id }
        }.to raise_error("Not available")
      end
    end
  end
    
end