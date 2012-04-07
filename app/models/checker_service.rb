class CheckerService
  def initialize(exam, answers)
    @exam, @answers = exam, answers
    @fetch_correct_answers, @correct_questions = [], []
  end
  
  def user_correct_questions
    if @correct_questions.empty?
      @answers[0].each do |key, user_answer|
        question_number = key.to_i
        @correct_questions << correct_answers[question_number].question if user_answer == correct_answers[question_number].title
      end
    end
      
    @correct_questions
  end
  
  def user_incorrect_questions
    @exam.questions - user_correct_questions
  end
  
  def count_user_correct_questions
    user_correct_questions.count
  end
  
  def count_user_incorrect_questions
    user_incorrect_questions.count
  end
  
  private 
  
  def correct_answers
    if @fetch_correct_answers.empty?
      @exam.questions.each do |question|
        @fetch_correct_answers << question.answers.select(&:correct).pop 
      end
    end
    
    @fetch_correct_answers
  end
  
end