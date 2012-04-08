class CheckerService
  def initialize(exam, answers)
    @exam, @answers = exam, answers
    @fetch_correct_answers, @correct_questions = [], []
  end
  
  def grade
    total = user_correct_questions.collect(&:weight).inject(0.0) do |total, current_weight| 
      total + current_weight
    end
    
    ((total / total_weight) * 10).round(1)
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
  
  def percentage_user_correct_questions
    ((count_user_correct_questions.to_f / @exam.questions.count) * 100).round(1).to_i
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
  
  def total_weight
    @exam.questions.collect(&:weight).inject(0.0) { |total_weight, current_weight| total_weight + current_weight }
  end
  
end