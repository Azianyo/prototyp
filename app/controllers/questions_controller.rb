class QuestionsController < ApplicationController
  def index
    @photo = Photo.find(params[:photo_id])
    @suite = Suite.find(params[:suite_id])
    @question = Question.where(:suite_id => @suite.id).order(:id).first
    redirect_to photo_suite_question_path(@photo, @suite, @question)
  end
  def show
    @question = Question.find(params[:id])
  end

end
