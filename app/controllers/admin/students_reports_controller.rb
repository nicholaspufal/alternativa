class Admin::StudentsReportsController < Admin::ReportsController
  def index
    @students = Student.all
  end
  
  def show
    @student = Student.find(params[:id])
    @groups = @student.groups
  end
end