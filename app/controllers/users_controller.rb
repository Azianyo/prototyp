class UsersController < ApplicationController
  def show
    @users_points = UsersTestStat.where(:user_id => current_user.id).pluck(:points).reduce(:+)
    @answer_ids_done = Reply.where(:user_id => current_user.id).order("updated_at desc").pluck(:answer_id)
    @photos_done = Array.new
    @answer_ids_done.each do |answer_id|
      @photos_done << Photo.find(Answer.find(answer_id).photo_id)
    end
    @photos_done = @photos_done.uniq
  end
end
