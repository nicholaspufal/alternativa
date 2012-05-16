class Admin::ExamsController < Admin::AdminController

  def index    
    @exams = Exam.order("start_time DESC")
  end
  
  def new
    @exam = Exam.new
    
    3.times do
       question = @exam.questions.build
       4.times { question.answers.build }
    end
  end
  
  def edit
    @exam = Exam.find(params[:id])
  end
  
  def create
    @exam = Exam.new(params[:exam])
    
    if @exam.save 
      flash[:notice] = "Prova cadastrada com sucesso!" 
      redirect_to [:admin,@exam]
    else
      render :new
    end
  end
  
  def update
    @exam = Exam.find(params[:id])
    
    if @exam.update_attributes(params[:exam])
      flash[:notice] = "Prova atualizada com sucesso!" 
      redirect_to [:admin,@exam]
    else
      render :edit
    end
    
  end
  
  def show
    @exam = Exam.find(params[:id])
    respond_with @exam
  end
  
  def destroy
    @exam = Exam.find(params[:id])
    @exam.destroy
    redirect_to admin_exams_path
  end
  
end
