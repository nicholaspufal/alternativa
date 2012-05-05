class Admin::GroupsReportsController < Admin::ReportsController
  def index
    @groups = Group.all
  end
  
  def show
    @group = Group.find(params[:id])
  end
end