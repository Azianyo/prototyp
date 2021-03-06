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
      if @users_points==0
        @users_percentage = 0
      else
        @users_percentage = (@users_points/@users_all_points)*100.round(2)
        @users_percentage = sprintf('%.2f', @users_percentage)
        @photos_done = @photos_done.uniq
    end
    else
      @users_percentage = 0
      @users_points = 0
    end
  end

  def create
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    if @user.destroy then
        redirect_to root_url, notice: "User deleted."
    end
  end
end
