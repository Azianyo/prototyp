class Suite < ActiveRecord::Base
  has_many :questions
  has_many :users_test_stats
end
