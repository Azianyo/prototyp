class UsersTestStat < ActiveRecord::Base
  belongs_to :user
  belongs_to :suite
  belongs_to :photo

  def self.percentage(suite_name, user_id, photo_id)
    if UsersTestStat.where(:user_id => user_id, :photo_id => photo_id, :suite_id => Suite.find_by(:name => suite_name).id).order(:times_done).last.nil? then
      0
    else
      UsersTestStat.where(:user_id => user_id, :photo_id => photo_id, :suite_id => Suite.find_by(:name => suite_name).id).order(:times_done).last.percent
    end
  end
end
