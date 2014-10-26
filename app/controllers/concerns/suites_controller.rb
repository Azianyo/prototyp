class SuitesController < ApplicationController
  def index
    @photo = Photo.find(params[:photo_id])
    @suites = Suite.all
    @questions = Question.all
  end

  def show
    @suite = Suite.find(params[:id])
    @questions = Question.includes(:answers).where(:suite_id => @suite.id)

  end

end
