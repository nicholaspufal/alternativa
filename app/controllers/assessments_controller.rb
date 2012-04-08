class AssessmentsController < ApplicationController
  def index
    #PENDING: deve listar apenas as provas que o estudante tem acesso e que nao realizou ainda
    @exams = Exam.all
    respond_with @exams
  end
    
  def new
    @exam = Exam.find(params[:exam_id])
    @assessment = Assessment.new
  end
  
  def create
    #PENDING: assim como a INDEX, deve ter um before_filter para evitar que um aluno responda uma prova q ja fez
    @exam = Exam.find(params[:exam_id])
    checker = CheckerService.new(@exam, params[:answers])
    @assessment = Assessment.new(:exam => @exam, :student => current_user, :grade => checker.grade)
    @assessment.save
    
    # notice aqui? para que? tem utilidade?
    redirect_to exam_assessment_path(@exam, @assessment), :notice => "Resultado enviado com sucesso."
  end
  
  def show
    @exam = Exam.find(params[:exam_id])
    @assessment = Assessment.where(:student => current_user, :exam => @exam)
  end
  
end
