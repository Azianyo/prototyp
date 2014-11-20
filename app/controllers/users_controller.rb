class UsersController < ApplicationController
  def show
    @photos_done = []
    @users_points = UsersTestStat.where(:user_id => current_user.id).pluck(:points).reduce(:+)
    UsersTestStat.all.each do |usersstat|
      @photos_done << Photo.find(usersstat.photo_id)
    end
    @photos_done = @photos_done.uniq
  end
end
