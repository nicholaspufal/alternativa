class Admin::GroupsReportsController < Admin::ReportsController
  def index
    @groups = Group.scoped.ordered
  end
  
  def show
    @group = Group.find(params[:id])
    @exams = @group.exams.ordered
    @students = @group.students.ordered
  end
end