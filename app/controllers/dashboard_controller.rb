class DashboardController < ApplicationController
  def index
    @photos = Photo.all
    @point_check_percent = 0
  end

end
