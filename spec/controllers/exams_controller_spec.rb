require 'spec_helper'
require 'ostruct'

describe ExamsController do
  
  def valid_attributes
    {
    }
  end
  
  describe "GET index" do
    it "assigns all exams as @exams" do
     response.should be_successful 
    end
  end

  describe "GET new" do
    
    it "assigns a new exam as @exam" do
      get :new
      assigns(:exam).should be_a_new(Exam)
    end
    
    context "create questions and answers for the exam" do

      let(:build_object) { mock().as_null_object }
      
      it "should instantiate at least 3 questions" do
        exam_questions = mock("questions for an exam").as_null_object
        Exam.any_instance.stub(:questions).and_return(exam_questions)
        exam_questions.stub(:build).and_return(build_object)
        exam_questions.should_receive(:build).exactly(3).times
        get :new  
      end
          
      it "should instantiate at least 4 answers for each of the 3 questions" do
        Question.any_instance.stub(:answers).and_return(build_object)
        build_object.should_receive(:build).exactly(12).times
        get :new      
      end  
      
    end
  end
  
  describe "POST create" do
    
    describe "with valid params" do
      
      before(:each) do
        Exam.any_instance.stub(:save).and_return(true)
      end

      it "assigns a newly created exam as @exam" do
        Exam.should_receive(:new).and_return(mock_model(Exam).as_null_object)
        post :create
      end
  
      it "redirects to the created exam" do
        post :create
        response.should redirect_to(Exam.last)
      end
    end
  
    describe "with invalid params" do
      
      before(:each) do
        Exam.any_instance.stub(:save).and_return(false)
      end
      
      it "assigns a newly created but unsaved exam as @exam" do
        post :create
        assigns(:exam).should be_a_new(Exam)
      end
  
      it "re-renders the 'new' template" do
        post :create
        response.should render_template("new")
      end
    end
  end
  
  describe "GET show" do
     it "assigns the requested exam as @exam" do
       exam = mock_model(Exam)
       Exam.stub(:find).and_return(exam)
       
       get :show, :id => exam.id.to_s
       assigns(:exam).should eq(exam)
     end
   end

  describe "GET edit" do
    it "assigns the requested exam as @exam" do
      exam = mock_model(Exam)
      Exam.stub(:find).and_return(exam)

      get :edit, :id => exam.id.to_s
      assigns(:exam).should eq(exam)
    end
  end
  
  describe "PUT update" do
    describe "with valid params" do
      
      before(:each) do
        @exam = mock_model(Exam).as_null_object
        Exam.stub(:find).and_return(@exam)
      end
      
      it "updates the requested exam" do
        @exam.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => @exam.id, :exam => {'these' => 'params'}
      end
  
      it "assigns the requested exam as @exam" do
        put :update, :id => @exam.id
        assigns(:exam).should eq(@exam)
      end
        
      it "redirects to the exam" do
        put :update, :id => @exam.id
        response.should redirect_to(@exam)
      end
    end
  
    describe "with invalid params" do
      
      before(:each) do
        @exam = mock_model(Exam).as_null_object
        Exam.stub(:find).and_return(@exam)
        @exam.stub(:update_attributes).and_return(false)
      end
      
      it "assigns the exam as @exam" do
        put :update, :id => @exam.id.to_s
        assigns(:exam).should eq(@exam)
      end
  
      it "re-renders the 'edit' template" do
        put :update, :id => @exam.id.to_s
        response.should render_template("edit")
      end
    end
  end
   
  describe "DELETE destroy" do
    
    before(:each) do
      @exam = Factory(:exam)
      Exam.stub(:find).and_return(@exam)
    end
    
    it "destroys the requested exam" do
      expect {
        delete :destroy, :id => @exam.id.to_s
      }.to change(Exam, :count).by(-1)
    end
  
    it "redirects to the exams list" do
      delete :destroy, :id => @exam.id.to_s
      response.should redirect_to(exams_url)
    end
  end

end
