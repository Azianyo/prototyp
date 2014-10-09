class Photo < ActiveRecord::Base
  has_many :answers
  # mount_uploader :name, PhotoUploader
end
