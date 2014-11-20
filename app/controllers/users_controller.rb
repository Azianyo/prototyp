class UsersController < ApplicationController
  def show
    @photos_done = []
    @users_all_points = 0
    @users_points = UsersTestStat.where(:user_id => current_user.id).pluck(:points).reduce(:+)
    UsersTestStat.all.each do |usersstat|
      @users_all_points += (usersstat.points*100)/usersstat.percent
      @photos_done << Photo.find(usersstat.photo_id)
    end
    @users_percentage = (@users_points/@users_all_points)*100
    @photos_done = @photos_done.uniq
  end
end
