require 'spec_helper'

describe Question do
  context "validations" do
    it "should have only one answer marked as correct" do
      question = FactoryGirl.build(:question)
      question.answers << FactoryGirl.build(:answer, :correct => true)
      question.should_not be_valid
    end
  
    it "should have at least one of the answers marked as correct" do
      question = FactoryGirl.build(:question_with_no_answers)
      3.times { question.answers << FactoryGirl.build(:answer) }
      question.should have_at_least(1).errors_on(:base)
    end
    
    it "should have a question weight" do
      should have(1).errors_on(:weight)
    end
  end
end
