class User < ActiveRecord::Base
  has_many :users_answers
  has_many :users_test_stats
  has_many :questions, through :users_answers
  has_many :users_roles
end
