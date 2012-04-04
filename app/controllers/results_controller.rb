class ResultsController < ApplicationController

  def show
    @exam = Exam.find(params[:id])
    respond_with @exam
  end
    
  def new
    @exam = Exam.find(params[:exam_id])
    @result = Result.new(:exam => @exam)
  end
  
  def create
  end
  
end
