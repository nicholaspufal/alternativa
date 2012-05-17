require 'spec_helper'

describe StudentReportPresenter do
  context "show result" do    
    before(:each) do
      @exam = FactoryGirl.create(:exam)
      @student = FactoryGirl.create(:student)
      @student_report_presenter = StudentReportPresenter.new(@student, view)
    end
    
    it "should return 'N/R' when the student didn't answer the exam yet" do
      @student_report_presenter.show_result(@exam).should include("N/R")
    end
    
    it "should return the grade when the student did answer the exam" do
      Assessment.new(:student => @student, :exam => @exam, :grade => 8.6).save!
      @student_report_presenter.show_result(@exam).should eq(8.6)
    end
  end
end