require 'spec_helper'

describe Exam do

  context "validations" do
    it "should have a title" do
      subject.should have_at_least(1).error_on(:title)
    end
    
    it "should have at least one question" do
      subject.should have_at_least(1).error_on(:base)
    end
    
    it "should have a duration" do
      subject.should have_at_least(1).error_on(:duration)
    end
    
    it "should have a start_time" do
      subject.should have_at_least(1).error_on(:start_time)
    end
  end
  
  context "scope current exams" do
    it "should list all exams that are below current time/date, but not more than 6 hours ago" do
      pretend_now_is(Time.parse("2012-04-28 15:30")) do 
        exam1 = FactoryGirl.create(:exam, :start_time => Time.parse("2012-04-28 15:20"))
        exam2 = FactoryGirl.create(:exam, :start_time => Time.parse("2012-04-28 11:20"))
        exam3 = FactoryGirl.create(:exam, :start_time => Time.parse("2012-04-28 09:18"))
        exam4 = FactoryGirl.create(:exam, :start_time => Time.parse("2012-04-29 13:20"))
        exam5 = FactoryGirl.create(:exam, :start_time => Time.parse("2012-04-27 13:20"))

        Exam.current_exams.should eq([exam1, exam2])
      end
    end
  end
  
  context "times" do
    it "should inform the end time for the exam" do
      exam = FactoryGirl.create(:exam, 
                                :start_time => Time.parse("2012-04-28 15:20"),
                                :duration => 2.5)
      exam.end_time.should == Time.parse("2012-04-28 17:50")
    end
  end
end