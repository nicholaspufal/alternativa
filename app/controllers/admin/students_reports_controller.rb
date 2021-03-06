class Admin::StudentsReportsController < Admin::ReportsController
  def index
    @students = Student.scoped.ordered
  end
  
  def show
    @student = Student.find(params[:id])
    @groups = @student.groups.ordered
  end
end