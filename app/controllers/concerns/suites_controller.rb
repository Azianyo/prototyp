class SuitesController < ApplicationController
  def index
    @photo = Photo.find(params[:photo_id])
    @suites = Suite.all
    @questions = Question.all
  end

end
