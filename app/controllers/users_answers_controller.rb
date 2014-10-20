class UsersAnswersController < ApplicationController
  def index
    #@users_answers = Users_answer.all
    @photo = Photo.find(params[:photo_id])
    @suite = Suite.find(params[:suite_id])
    @question = Question.find(params[:question_id])
    @questions_ids = @suite.questions.order(:id)
  end
end
