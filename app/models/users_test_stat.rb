class UsersTestStat < ActiveRecord::Base
  belongs_to :user
  belongs_to :suite
  belongs_to :photo
end
