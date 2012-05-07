require 'spec_helper'

describe Assessment do
  it "should find the result when provided the student and exam" do
    @student = FactoryGirl.create(:student)
    @exam = FactoryGirl.create(:exam)
    
    Assessment.find_result(@student, @exam) == nil
    
    Assessment.create(:exam => stub_model(Exam), :student => @student, :grade => 10.0)
    Assessment.find_result(@student, @exam) == nil
    
    assessment = Assessment.create(:exam => @exam, :student => @student, :grade => 10.0)
    Assessment.find_result(@student, @exam).should eq(assessment)
  end
end