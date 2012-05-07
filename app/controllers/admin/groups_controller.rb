class Admin::GroupsController < Admin::AdminController
  def index
    @groups = Group.all
    respond_with @groups
  end

  def new
    @group = Group.new
    respond_with @group
  end

  def edit
    @group = Group.find(params[:id])
  end

  def create
    @group = Group.new(params[:group])

    if @group.save 
      flash[:notice] = "Grupo cadastrado com sucesso!" 
      redirect_to admin_groups_path
    else
      render :new
    end
  end

  def update
    @group = Group.find(params[:id])
    
    if @group.update_attributes(params[:group])
      flash[:notice] = "Grupo atualizado com sucesso!" 
      redirect_to admin_groups_path
    else
      render :edit
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to admin_groups_path
  end
end
