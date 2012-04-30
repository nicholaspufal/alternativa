#encoding: utf-8

class AssessmentsController < ApplicationController
  before_filter :check_access, :only => [:new, :create, :show]
  before_filter :redirect_admin
  
  def index
    #refatorar
    @upcoming_exams = current_user.exams.upcoming_exams - current_user.exams_done
    @current_exams = current_user.exams.current_exams - current_user.exams_done
  end
    
  def new
    @exam = Exam.find(params[:exam_id])
    @assessment = Assessment.new
  end
  
  def create
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
    
    unless ProxyService.check_permission(current_user, exam)
      flash[:alert] = "Você não possui acesso à avaliação consultada. Verifique com seu professor."
      redirect_to root_path and return
    end
    
    unless ProxyService.check_availability(current_user, exam)
      flash[:alert] = "A avaliação que você tentou acessar já foi realizada ou ainda não está em execução. Verifique a data de início."
      redirect_to root_path and return
    end
    
    unless ProxyService.check_first_time(current_user, exam)
      flash[:alert] = "A avaliação que você tentou acessar já foi respondida. Apenas uma tentativa é permitida."
      redirect_to root_path and return
    end
  end
  
  def redirect_admin
    redirect_to admin_root_path if current_user.admin? 
  end
  
end
