class Admin::StudentsController < Admin::AdminController
  def index
    @students = Student.all
    respond_with @students
  end

  def show
    @student = Student.find(params[:id])
    respond_with @student
  end

  def new
    @student = Student.new
    respond_with @student
  end

  def edit
    @student = Student.find(params[:id])
  end

  def create
    @student = Student.new(params[:student])
    
    if @student.save 
      flash[:notice] = "Aluno cadastrado com sucesso!" 
      redirect_to [:admin, @student]
    else
      render :new
    end
  end

  def update
    @student = Student.find(params[:id])

    if @student.update_attributes(params[:student])
      flash[:notice] = "Aluno atualizado com sucesso!" 
      redirect_to [:admin, @student]
    else
      render :edit
    end
  end

  def destroy
    @student = Student.find(params[:id])
    flash[:notice] = "Aluno removido com sucesso!" if @student.destroy
    redirect_to admin_students_path
  end
end
