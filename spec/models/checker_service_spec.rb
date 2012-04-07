require 'spec_helper'

describe CheckerService do
  before(:all) do
    @exam = FactoryGirl.create(:exam)
  end
  
  context "should list all the correct and all the wrong questions" do
    before(:all) do
      @answers = [ 
        {
          "0"=>"resposta certa",
          "1"=>"resposta certa",
          "2"=>"resposta certa",
          "3"=>"resposta errada"
        }
      ]
    end
    
    it "should list all the correct questions" do
      checker = CheckerService.new(@exam, @answers)
      checker.user_correct_questions.should == [@exam.questions[0], @exam.questions[1], @exam.questions[2]]
    end

    it "should list all the wrong questions" do
      checker = CheckerService.new(@exam, @answers)
      checker.user_incorrect_questions.should == [@exam.questions[3]]
    end
  end  

  context "should return the number of correct questions" do  
    it "should count all correct questions when the student filled everything" do
      answers = [ 
        {
          "0"=>"resposta certa",
          "1"=>"resposta certa",
          "2"=>"resposta certa",
          "3"=>"resposta errada"
        }
      ]

      checker = CheckerService.new(@exam, answers)
      checker.count_user_correct_questions.should == 3
    end
    
    it "should count all correct questions when the student forgot to answer some questions" do
      answers = [ 
        {
          "0"=>"resposta certa",
          "1"=>"resposta certa",
          "3"=>"resposta certa"
        }
      ]
          
      checker = CheckerService.new(@exam, answers)
      checker.count_user_correct_questions.should == 3   
    end
  end
  
  context "should return the number of incorrect questions" do
    it "should count all incorrect questions when the student forgot to answer some questions" do
      answers = [ 
        {"0"=>"resposta certa"}
      ]
          
      checker = CheckerService.new(@exam, answers)
      checker.count_user_incorrect_questions.should == 3 
    end
    
    it "should count all incorrect questions when the student filled everything" do
      answers = [ 
        {
          "0"=>"resposta certa",
          "1"=>"resposta certa",
          "2"=>"resposta certa",
          "3"=>"resposta certa"
        }
      ]
          
      checker = CheckerService.new(@exam, answers)
      checker.count_user_incorrect_questions.should == 0
    end
  end
  
end