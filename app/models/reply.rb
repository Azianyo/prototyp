class Reply < ActiveRecord::Base
  validates_presence_of :answer_id, :user_id
  belongs_to :answer
  belongs_to :user
end
