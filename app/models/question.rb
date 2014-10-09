class Question < ActiveRecord::Base
  belongs_to :questionset
  has_one :answer
end
