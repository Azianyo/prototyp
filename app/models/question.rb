class Question < ActiveRecord::Base
  belongs_to :suite
  has_one :answer
end
