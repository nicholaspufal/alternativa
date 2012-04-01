class ExamsController < ApplicationController

  def show
    @exam = Exam.find(params[:id])
    respond_with @exam
  end
    
end
