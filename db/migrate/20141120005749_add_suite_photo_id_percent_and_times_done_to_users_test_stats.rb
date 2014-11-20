class AddSuitePhotoIdPercentAndTimesDoneToUsersTestStats < ActiveRecord::Migration
  def change
    remove_column :users_test_stats, :question_id
    add_column :users_test_stats, :suite_id, :integer
    add_column :users_test_stats, :photo_id, :integer
    add_column :users_test_stats, :times_done, :integer
    add_column :users_test_stats, :percent, :integer
  end
end
