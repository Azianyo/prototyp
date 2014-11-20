class Photo < ActiveRecord::Base
  has_many :answers
  has_many :users_test_stats
  mount_uploader :picture, PhotoUploader
end
