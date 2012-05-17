require 'spec_helper'

describe GroupReportPresenter do
  
  before(:each) do
    @exam = FactoryGirl.create(:exam)
    @student = FactoryGirl.create(:student)
    @group_report_presenter = GroupReportPresenter.new(Group.new, view)
  end
  
  context "result class" do
    before(:each) do
      Assessment.new(:student => @student, :exam => @exam, :grade => 8.6).save!
      @group_report_presenter.stub(:has_filter?).and_return(true)
    end
    
    it "should return 'under_grade' class to all grades below the desired grade" do
      @group_report_presenter.stub(:filter_params).and_return(9)
      @group_report_presenter.result_class(@student, @exam).should eq("under_grade")
    end 
    
    it "should return 'over_grade' class to all grades above the desired grade" do
      @group_report_presenter.stub(:filter_params).and_return(5)
      @group_report_presenter.result_class(@student, @exam).should eq("over_grade")   
    end
    
    it "should return 'over_grade' class to all grades equal to the desired grade" do
      @group_report_presenter.stub(:filter_params).and_return(8.6)
      @group_report_presenter.result_class(@student, @exam).should eq("over_grade")  
    end
  end
  
  context "show result" do    
    it "should return 'N/R' when the student didn't answer the exam yet" do
      @group_report_presenter.show_result(@student, @exam).should include("N/R")
    end
    
    it "should return the grade when the student did answer the exam" do
      Assessment.new(:student => @student, :exam => @exam, :grade => 8.6).save!
      @group_report_presenter.show_result(@student, @exam).should eq(8.6)
    end
  end
end