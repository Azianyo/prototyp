class QuestionsController < ApplicationController

  def
    @question = Question.find(params[:id])
  end

end
