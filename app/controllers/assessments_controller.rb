class AssessmentsController < ApplicationController
  before_filter :check_access, :only => [:new, :create, :show]
  
  def index
    @upcoming_exams = current_user.exams.upcoming_exams
    @current_exams = current_user.exams.current_exams
  end
    
  def new
    @exam = Exam.find(params[:exam_id])
    @assessment = Assessment.new
  end
  
  def create
    #PENDING: assim como a INDEX, deve ter um before_filter para evitar que um aluno responda uma prova q ja fez
    @exam = Exam.find(params[:exam_id])
    @checker = CheckerService.new(@exam, params[:answers])
    @assessment = Assessment.new(:exam => @exam, :student => current_user, :grade => @checker.grade)
    @assessment.save

    render 'show' 
  end
  
  def show
    @exam = Exam.find(params[:exam_id])
    @assessment = Assessment.where(:student => current_user, :exam => @exam)
  end
  
  protected
  
  def check_access
    exam = Exam.find(params[:exam_id])
    raise "No permission" unless (current_user.groups & exam.groups).count > 0
    raise "Not available" unless current_user.exams.current_exams.include? exam
  end
  
end
