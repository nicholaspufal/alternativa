class AssessmentsController < ApplicationController
  def index
    @exams = Exam.scoped
    @upcoming_exams = @exams.upcoming_exams
    @current_exams = @exams.current_exams
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
    
    # notice aqui? para que? tem utilidade?
    render 'show' 
  end
  
  def show
    @exam = Exam.find(params[:exam_id])
    @assessment = Assessment.where(:student => current_user, :exam => @exam)
  end
  
end
