require 'spec_helper'
require 'ostruct'

describe ExamsController do
  
  def valid_attributes
    {}
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
      it "creates a new Exam" do
        expect {
          post :create, :exam => valid_attributes
        }.to change(Exam, :count).by(1)
      end
  
      it "assigns a newly created exam as @exam" do
        post :create, :exam => valid_attributes
        assigns(:exam).should be_a(Exam)
        assigns(:exam).should be_persisted
      end
  
      it "redirects to the created exam" do
        post :create, :exam => valid_attributes
        response.should redirect_to(Exam.last)
      end
    end
  
    describe "with invalid params" do
      it "assigns a newly created but unsaved exam as @exam" do
        # Trigger the behavior that occurs when invalid params are submitted
        Exam.any_instance.stub(:save).and_return(false)
        post :create, :exam => {}
        assigns(:exam).should be_a_new(Exam)
      end
  
      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Exam.any_instance.stub(:save).and_return(false)
        post :create, :exam => {}
        response.should render_template("new")
      end
    end
  end
  
  describe "GET show" do
     it "assigns the requested exam as @exam" do
       exam = Exam.create! valid_attributes
       get :show, :id => exam.id.to_s
       assigns(:exam).should eq(exam)
     end
   end

  # describe "GET edit" do
  #   it "assigns the requested exam as @exam" do
  #     exam = Exam.create! valid_attributes
  #     get :edit, :id => exam.id.to_s
  #     assigns(:exam).should eq(exam)
  #   end
  # end
  # 
  # describe "PUT update" do
  #   describe "with valid params" do
  #     it "updates the requested exam" do
  #       exam = Exam.create! valid_attributes
  #       # Assuming there are no other exams in the database, this
  #       # specifies that the Exam created on the previous line
  #       # receives the :update_attributes message with whatever params are
  #       # submitted in the request.
  #       Exam.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
  #       put :update, :id => exam.id, :exam => {'these' => 'params'}
  #     end
  # 
  #     it "assigns the requested exam as @exam" do
  #       exam = Exam.create! valid_attributes
  #       put :update, :id => exam.id, :exam => valid_attributes
  #       assigns(:exam).should eq(exam)
  #     end
  # 
  #     it "redirects to the exam" do
  #       exam = Exam.create! valid_attributes
  #       put :update, :id => exam.id, :exam => valid_attributes
  #       response.should redirect_to(exam)
  #     end
  #   end
  # 
  #   describe "with invalid params" do
  #     it "assigns the exam as @exam" do
  #       exam = Exam.create! valid_attributes
  #       # Trigger the behavior that occurs when invalid params are submitted
  #       Exam.any_instance.stub(:save).and_return(false)
  #       put :update, :id => exam.id.to_s, :exam => {}
  #       assigns(:exam).should eq(exam)
  #     end
  # 
  #     it "re-renders the 'edit' template" do
  #       exam = Exam.create! valid_attributes
  #       # Trigger the behavior that occurs when invalid params are submitted
  #       Exam.any_instance.stub(:save).and_return(false)
  #       put :update, :id => exam.id.to_s, :exam => {}
  #       response.should render_template("edit")
  #     end
  #   end
  # end
  # 
  # describe "DELETE destroy" do
  #   it "destroys the requested exam" do
  #     exam = Exam.create! valid_attributes
  #     expect {
  #       delete :destroy, :id => exam.id.to_s
  #     }.to change(Exam, :count).by(-1)
  #   end
  # 
  #   it "redirects to the exams list" do
  #     exam = Exam.create! valid_attributes
  #     delete :destroy, :id => exam.id.to_s
  #     response.should redirect_to(exams_url)
  #   end
  # end

end
