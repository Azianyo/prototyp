class RepliesController < ApplicationController
  def index
    #@users_answers = Users_answer.all
    @photo = Photo.find(params[:photo_id])
    @suite = Suite.find(params[:suite_id])
    @question = Question.find(params[:question_id])
    @questions_ids = @suite.questions.order(:id)
  end

  def create
    answer = Answer.find(params[:answer_id])
    @reply = answer.replies.create(:user_id => current_user.id)
    redirect_to params[:redirect_url]
  end

  def new_reply
  end
end
