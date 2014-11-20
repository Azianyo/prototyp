class ChangePercentInUsersTestStatsToFloat < ActiveRecord::Migration
  def change
    change_column :users_test_stats, :percent, :float
  end
end
