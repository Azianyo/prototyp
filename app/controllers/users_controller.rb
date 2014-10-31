class UsersController < ApplicationController
  def show
    @users_points = UsersTestStat.where(:user_id => current_user.id).pluck(:points).reduce(:+)

  end
end
