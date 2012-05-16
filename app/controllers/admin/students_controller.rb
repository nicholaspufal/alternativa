class Admin::StudentsController < Admin::AdminController
  
  def index
    @students = Student.scoped
    @active_students = @students.active_students
    @pending_students = @students.pending_students
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])

    if @student.update_attributes(params[:student])
      flash[:notice] = "Aluno atualizado com sucesso!" 
      redirect_to admin_students_path
    else
      render :edit
    end
  end

  def destroy
    @student = Student.find(params[:id])
    flash[:notice] = "Aluno removido com sucesso!" if @student.destroy
    redirect_to admin_students_path
  end
  
  def toggle_status
    @student = Student.find(params[:student_id])
    flash[:notice] = "Aluno atualizado com sucesso" if @student.toggle_status
    redirect_to admin_students_path
  end
end
