require 'spec_helper'

describe StudentsController do

  def valid_session
    {}
  end
  
  let (:student) { mock_model(Student) }

  describe "GET index" do
    it "assigns all students as @students" do
      students = [FactoryGirl.create(:student), FactoryGirl.create(:student)]
      get :index, {}, valid_session
      assigns(:students).should eq(students)
    end
  end

  describe "GET show" do
    it "assigns the requested student as @student" do
      Student.stub(:find).and_return(student)
      get :show, {:id => "any ID"}, valid_session
      assigns(:student).should eq(student)
    end
  end

  describe "GET new" do
    it "assigns a new student as @student" do
      get :new, {}, valid_session
      assigns(:student).should be_a_new(Student)
    end
  end

  describe "GET edit" do
    it "assigns the requested student as @student" do
      Student.stub(:find).and_return(student)
      get :edit, {:id => "any ID"}, valid_session
      assigns(:student).should eq(student)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      before(:each) do
        Student.stub(:new).and_return(student)
        student.stub(:save).and_return(true)
      end
      
      it "creates a new Student" do
        Student.should_receive(:new)
             .with(hash_including('these' => 'params'))
                    
        post :create, {:student => {'these' => 'params'}}, valid_session
      end

      it "assigns a newly created student as @student" do
        post :create, {:student => {'these' => 'params'}}, valid_session
        assigns(:student).should be_a(Student)
        assigns(:student).should be_persisted
      end

      it "redirects to the created student" do
        post :create, {:student => {'these' => 'params'}}, valid_session
        response.should redirect_to(student)
      end
    end

    describe "with invalid params" do
      before(:each) do
        Student.any_instance.stub(:save).and_return(false)
      end
      
      it "assigns a newly created but unsaved student as @student" do
        post :create, {:student => {}}, valid_session
        assigns(:student).should be_a_new(Student)
      end

      it "re-renders the 'new' template" do
        post :create, {:student => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      before(:each) do
        Student.stub(:find).and_return(student)
      end
      
      it "updates the requested student" do
        student.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => 'some id', :student => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested student as @student" do
        student.stub(:update_attributes).and_return(true)
        put :update, {:id => 'some id', :student => {'these' => 'params'}}, valid_session
        assigns(:student).should eq(student)
      end

      it "redirects to the student" do
        student.stub(:update_attributes).and_return(true)
        put :update, {:id => 'some id', :student => {'these' => 'params'}}, valid_session
        response.should redirect_to(student)
      end
    end

    describe "with invalid params" do
      
      before(:each) do
        Student.stub(:find).and_return(student)
        student.stub(:update_attributes).and_return(false)
      end
      
      it "assigns the student as @student" do  
        put :update, {:id => "some id"}, valid_session
        assigns(:student).should eq(student)
      end

      it "re-renders the 'edit' template" do
        put :update, {:id => "some id"}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    before(:each) do
      Student.stub(:find).and_return(student)
    end
    
    it "destroys the requested student" do
      student.should_receive(:destroy)  
      delete :destroy, {:id => "some random id"}, valid_session
    end

    it "redirects to the students list" do
      delete :destroy, {:id => "some random id"}, valid_session
      response.should redirect_to(students_url)
    end
  end

end
