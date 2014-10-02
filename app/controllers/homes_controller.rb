class HomesController < ApplicationController
  def index
    @photo_names = Dir.glob(File.join(Rails.root,"app/assets/images/photos/*.{jpg,jpeg,png}"))
    @photo_names = @photo_names.map do |name|
      name.gsub(File.join(Rails.root,"app/assets/images/photos/"), '')
    end
  end
end
