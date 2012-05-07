class Admin::GroupsReportsController < Admin::ReportsController
  def index
    @groups = Group.all
  end
  
  def show
    @group = Group.find(params[:id])
    @exams = @group.exams
  end
end