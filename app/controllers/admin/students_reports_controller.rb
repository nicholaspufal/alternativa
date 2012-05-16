class Admin::StudentsReportsController < Admin::ReportsController
  def index
    @students = Student.order("lower(name) ASC").all
  end
  
  def show
    @student = Student.find(params[:id])
    @groups = @student.groups
  end
end