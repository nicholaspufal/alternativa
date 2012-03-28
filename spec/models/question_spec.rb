require 'spec_helper'

describe Question do
  
  it "should have only one answer marked as correct" do
    question = FactoryGirl.build(:question_with_multiple_correct)
    question.should_not be_valid
  end
end
