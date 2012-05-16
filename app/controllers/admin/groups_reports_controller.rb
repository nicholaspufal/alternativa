class Admin::GroupsReportsController < Admin::ReportsController
  def index
    @groups = Group.order("lower(name) ASC").all
  end
  
  def show
    @group = Group.find(params[:id])
    @exams = @group.exams
  end
end