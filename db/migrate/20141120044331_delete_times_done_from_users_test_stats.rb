class DeleteTimesDoneFromUsersTestStats < ActiveRecord::Migration
  def change
    remove_column :users_test_stats, :times_done
  end
end
