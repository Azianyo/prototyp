class Question < ActiveRecord::Base
  belongs_to :suite
  has_many :answers

  def next
    suite.questions.where('id > ?', id).order(:id => :asc).first
  end

  def prev
    suite.questions.where('id < ?', id).order(:id => :desc).first
  end
end
