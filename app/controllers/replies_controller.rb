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
    @photo = Photo.find(params[:photo_id])
    @points = 0
    @suite_ids = []
    @answers = []
    @current_lap = 1
    @max_points = 0

    case @photo.level_of_difficulty
      when "high"
        @max_points = 15 * params[:answer].length
      when "medium"
        @max_points = 10 * params[:answer].length
      when "low"
        @max_points = 5 * params[:answer].length
    end

    params[:answer].each do |key,value|
      Reply.create(:answer_id => value, :user_id => current_user.id)
      if @photo.send(Question.find(key).parameter) == Answer.find(value).content then
        case @photo.level_of_difficulty
          when "high"
            @points += 15
          when "medium"
            @points += 10
          when "low"
            @points += 5
        end
      end
      @suite_ids << Question.find(key).suite_id
      @answers << Answer.find(value)
    end

    if UsersTestStat.exists?(:user_id => current_user.id, :suite_id => @suite_ids.last, :photo_id => @photo.id)
      @prev_stats = UsersTestStat.where(:user_id => current_user.id,
       :suite_id => @suite_ids.last, :photo_id => @photo.id)
      @last_lap = @prev_stats.order("times_done").last.times_done
      @current_lap = @last_lap + 1
      UsersTestStat.create(:user_id => current_user.id, :suite_id => @suite_ids.last,
       :photo_id => @photo.id, :points => @points, :percent => ((Float(@points)/Float(@max_points))*100),
       :times_done => @current_lap)
    else
      @current_lap = 0
      UsersTestStat.create(:user_id => current_user.id, :suite_id => @suite_ids.last,
       :photo_id => @photo.id, :points => @points, :percent => ((Float(@points)/Float(@max_points))*100),
       :times_done => @current_lap)
    end
  end
end
