class AssessmentsController < ApplicationController
  def index
    #listando todos temporariamente até a API ficar pronta
    @exams = Exam.all
    respond_with @exams
  end
    
  def new
    @exam = Exam.find(params[:exam_id])
    @assessment = Assessment.new
  end
  
  def create
    @exam = Exam.find(params[:exam_id])
    checker = CheckerService.new(@exam, params[:answers])
    raise checker.count_user_correct_questions.to_s
  end
  
end
