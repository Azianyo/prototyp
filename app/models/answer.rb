class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :photo
  has_many :users_answers
end
