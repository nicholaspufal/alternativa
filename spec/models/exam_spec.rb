require 'spec_helper'

describe Exam do

  context "validations" do
    it "should have a title" do
      subject.should have_at_least(1).error_on(:title)
    end
    
    it "should have at least one question" do
      subject.should have_at_least(1).error_on(:base)
    end
    
    it "should have a start_time" do
      subject.should have_at_least(1).error_on(:start_time)
    end
    
    it "should have a end_time" do
      subject.should have_at_least(1).error_on(:end_time)
    end
  end
  
  context "scope current exams" do
    it "should list all exams that are happening right now" do
      pretend_now_is(Time.parse("2012-04-28 15:30")) do 
        exam1 = FactoryGirl.create(:exam, 
                                   :start_time => Time.parse("2012-04-28 15:20"), 
                                   :end_time => Time.parse("2012-04-28 17:20")
                                   )

        exam2 = FactoryGirl.create(:exam, 
                                   :start_time => Time.parse("2012-04-28 11:20"), 
                                   :end_time => Time.parse("2012-04-28 16:20")
                                  )
                                  
        exam3 = FactoryGirl.create(:exam, 
                                   :start_time => Time.parse("2012-04-28 09:18"), 
                                   :end_time => Time.parse("2012-04-28 11:18")
                                  )
                                  
        exam4 = FactoryGirl.create(:exam, 
                                   :start_time => Time.parse("2012-04-28 13:20"), 
                                   :end_time => Time.parse("2012-04-28 15:20")
                                  )                                  
                                  
        exam5 = FactoryGirl.create(:exam, 
                                   :start_time => Time.parse("2012-04-29 13:20"), 
                                   :end_time => Time.parse("2012-04-29 15:20")
                                  )
                                   

        Exam.current_exams.should eq([exam1, exam2])
      end
    end
  end
end