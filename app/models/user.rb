class User < ActiveRecord::Base
  has_many :users_answers
  has_many :users_test_stats
end
