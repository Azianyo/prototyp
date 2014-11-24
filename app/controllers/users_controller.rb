class UsersController < ApplicationController
  def show
    if current_user == User.find(params[:id])then
      @user = current_user
    else
      @user = User.find(params[:id])
    end

    @photos_done = []
    @users_all_points = 0
    @users_stats = UsersTestStat.where(:user_id => @user.id)

    if !(@users_stats.empty?) then
      @users_points = @users_stats.pluck(:points).reduce(:+)
      @users_stats.each do |usersstat|
        @users_all_points += (usersstat.points*100)/usersstat.percent
        @photos_done << Photo.find(usersstat.photo_id)
      end
    @users_percentage = (@users_points/@users_all_points)*100
    @photos_done = @photos_done.uniq
    else
      @users_percentage = 0
      @users_points = 0
    end
  end
end
