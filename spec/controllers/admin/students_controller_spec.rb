require 'spec_helper'

describe Admin::StudentsController do

  login_admin
  
  let (:student) { mock_model(Student) }

  describe "GET index" do
    it "assigns all students as @students" do
      students = [FactoryGirl.create(:student, :email => "abc@gmail.com"), FactoryGirl.create(:student, :email => "abc2@gmail.com")]
      get :index, {}
      assigns(:students).should eq(students)
    end
  end

  describe "GET show" do
    it "assigns the requested student as @student" do
      Student.stub(:find).and_return(student)
      get :show, {:id => "any ID"}
      assigns(:student).should eq(student)
    end
  end

  describe "GET edit" do
    it "assigns the requested student as @student" do
      Student.stub(:find).and_return(student)
      get :edit, {:id => "any ID"}
      assigns(:student).should eq(student)
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      before(:each) do
        Student.stub(:find).and_return(student)
      end
      
      it "updates the requested student" do
        student.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => 'some id', :student => {'these' => 'params'}}
      end

      it "assigns the requested student as @student" do
        student.stub(:update_attributes).and_return(true)
        put :update, {:id => 'some id', :student => {'these' => 'params'}}
        assigns(:student).should eq(student)
      end

      it "redirects to the student" do
        student.stub(:update_attributes).and_return(true)
        put :update, {:id => 'some id', :student => {'these' => 'params'}}
        response.should redirect_to([:admin, student])
      end
    end

    describe "with invalid params" do
      
      before(:each) do
        Student.stub(:find).and_return(student)
        student.stub(:update_attributes).and_return(false)
      end
      
      it "assigns the student as @student" do  
        put :update, {:id => "some id"}
        assigns(:student).should eq(student)
      end

      it "re-renders the 'edit' template" do
        put :update, {:id => "some id"}
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
      delete :destroy, {:id => "some random id"}
    end

    it "redirects to the students list" do
      delete :destroy, {:id => "some random id"}
      response.should redirect_to(admin_students_url)
    end
  end

end
