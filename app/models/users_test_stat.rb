class UsersTestStat < ActiveRecord::Base
  belongs_to :user
  belongs_to :suite
  belongs_to :photo

  def self.percentage(suite_name, user_id, photo_id)
    if UsersTestStat.find_by(:user_id => user_id, :photo_id => photo_id, :suite_id => Suite.find_by(:name => suite_name).id).nil? then
      "1px"
    elsif UsersTestStat.find_by(:user_id => user_id, :photo_id => photo_id, :suite_id => Suite.find_by(:name => suite_name).id).percent == 0 then
      "1px"
    else
      "#{UsersTestStat.find_by(:user_id => user_id, :photo_id => photo_id, :suite_id => Suite.find_by(:name => suite_name).id).percent}%"
    end
  end

  def self.percent_outside(suite_name, user_id, photo_id)
    if UsersTestStat.find_by(:user_id => user_id, :photo_id => photo_id, :suite_id => Suite.find_by(:name => suite_name).id).nil? then
      "0%"
    else
      "#{UsersTestStat.find_by(:user_id => user_id, :photo_id => photo_id, :suite_id => Suite.find_by(:name => suite_name).id).percent}%"
    end
  end

end
