class DashboardController < ApplicationController
  def index
    @photos = Photo.all
  end

end
