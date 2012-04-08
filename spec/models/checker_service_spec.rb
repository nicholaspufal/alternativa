require 'spec_helper'

describe CheckerService do
  before(:all) do
    @exam = FactoryGirl.create(:exam)
  end
  
  context "retrieve the percentage of correct questions" do
    it "should return the percentage when the user has some answers correct" do
      answers = [ 
        {
          "0"=>"resposta certa",
          "1"=>"resposta certa",
          "2"=>"resposta certa",
          "3"=>"resposta errada"
        }
      ]

      checker = CheckerService.new(@exam, answers)
      checker.percentage_user_correct_questions.should equal(75)

      answers = [ 
        {
          "0"=>"resposta errada",
          "1"=>"resposta errada",
          "2"=>"resposta certa",
          "3"=>"resposta errada"
        }
      ]

      checker = CheckerService.new(@exam, answers)
      checker.percentage_user_correct_questions.should equal(25)
    end
    
    it "should return 0 when the user has none of the answers correct" do
      answers = [ 
        {
          "0"=>"resposta errada",
          "1"=>"resposta errada",
          "2"=>"resposta errada",
          "3"=>"resposta errada"
        }
      ]

      checker = CheckerService.new(@exam, answers)
      checker.percentage_user_correct_questions.should equal(0)
    end
  end
  
  context "should calculate the user grade" do
    it "should return the total when not all are correct" do
      answers = [ 
        {
          "0"=>"resposta certa",
          "1"=>"resposta certa",
          "2"=>"resposta certa",
          "3"=>"resposta errada"
        }
      ]

      checker = CheckerService.new(@exam, answers)
      checker.grade.should == 7.5
    end
      
    it "should return the total when questions have different weights" do
      exam = FactoryGirl.create(:exam_with_variable_weight_questions)
    
      answers = [ 
        {
          "0"=>"resposta errada",
          "1"=>"resposta certa", #got one question correct ~> weight 4
          "2"=>"resposta errada",
          "3"=>"resposta errada"
        }
      ]

      checker = CheckerService.new(exam, answers)
      checker.grade.should == 3.3
    end
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