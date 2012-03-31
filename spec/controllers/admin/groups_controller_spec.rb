require 'spec_helper'

describe Admin::GroupsController do

  def valid_session
    {}
  end
  
  let (:group) { mock_model(Group) }

  describe "GET index" do
    it "assigns all groups as @groups" do
      groups = [FactoryGirl.create(:group), FactoryGirl.create(:group)]
      get :index, {}, valid_session
      assigns(:groups).should eq(groups)
    end
  end

  describe "GET show" do
    it "assigns the requested group as @group" do
      Group.stub(:find).and_return(group)
      get :show, {:id => "any ID"}, valid_session
      assigns(:group).should eq(group)
    end
  end

  describe "GET new" do
    it "assigns a new group as @group" do
      get :new, {}, valid_session
      assigns(:group).should be_a_new(Group)
    end
  end

  describe "GET edit" do
    it "assigns the requested group as @group" do
      Group.stub(:find).and_return(group)
      get :edit, {:id => "any ID"}, valid_session
      assigns(:group).should eq(group)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      before(:each) do
        Group.stub(:new).and_return(group)
        group.stub(:save).and_return(true)
      end
      
      it "creates a new Group" do
        Group.should_receive(:new)
             .with(hash_including('these' => 'params'))
                    
        post :create, {:group => {'these' => 'params'}}, valid_session
      end

      it "assigns a newly created group as @group" do
        post :create, {:group => {'these' => 'params'}}, valid_session
        assigns(:group).should be_a(Group)
        assigns(:group).should be_persisted
      end

      it "redirects to the created group" do
        post :create, {:group => {'these' => 'params'}}, valid_session
        response.should redirect_to([:admin, group])
      end
    end

    describe "with invalid params" do
      before(:each) do
        Group.any_instance.stub(:save).and_return(false)
      end
      
      it "assigns a newly created but unsaved group as @group" do
        post :create, {:group => {}}, valid_session
        assigns(:group).should be_a_new(Group)
      end

      it "re-renders the 'new' template" do
        post :create, {:group => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      before(:each) do
        Group.stub(:find).and_return(group)
      end
      
      it "updates the requested group" do
        group.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => 'some id', :group => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested group as @group" do
        group.stub(:update_attributes).and_return(true)
        put :update, {:id => 'some id', :group => {'these' => 'params'}}, valid_session
        assigns(:group).should eq(group)
      end

      it "redirects to the group" do
        group.stub(:update_attributes).and_return(true)
        put :update, {:id => 'some id', :group => {'these' => 'params'}}, valid_session
        response.should redirect_to([:admin, group])
      end
    end

    describe "with invalid params" do
      
      before(:each) do
        Group.stub(:find).and_return(group)
        group.stub(:update_attributes).and_return(false)
      end
      
      it "assigns the group as @group" do  
        put :update, {:id => "some id"}, valid_session
        assigns(:group).should eq(group)
      end

      it "re-renders the 'edit' template" do
        put :update, {:id => "some id"}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    before(:each) do
      Group.stub(:find).and_return(group)
    end
    
    it "destroys the requested group" do
      group.should_receive(:destroy)  
      delete :destroy, {:id => "some random id"}, valid_session
    end

    it "redirects to the groups list" do
      delete :destroy, {:id => "some random id"}, valid_session
      response.should redirect_to(admin_groups_url)
    end
  end

end
