class CreateUsersTestStats < ActiveRecord::Migration
  def change
    create_table :users_test_stats do |t|
      t.integer :points

      t.timestamps
    end
  end
end
