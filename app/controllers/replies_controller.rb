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

  def submit
    @replies = []
    @questions = []
    @answers = []
    @photo = Photo.find(params[:photo_id])
    params[:answer].each do |key,value|
      Reply.create(:answer_id => value, :user_id => current_user.id)
      if @photo.send(Question.find(key).parameter) == Answer.find(value) then
        if @photo.level_of_difficulty == "high" then
          UsersTestStat.create(:user_id => current_user.id, :question_id => key,:points => 12)
        elsif @photo.level_of_difficulty == "medium" then
          UsersTestStat.create(:user_id => current_user.id, :question_id => key, :points => 8)
        elsif @photo.level_of_difficulty == "low" then
        UsersTestStat.create(:user_id => current_user.id, :question_id => key, :points => 4)
        end
      else
        UsersTestStat.create(:user_id => current_user.id, :question_id => key, :points => 0)
      end
      @answers << Answer.find(value)
    end
  end
end
