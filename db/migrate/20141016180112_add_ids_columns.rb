class AddIdsColumns < ActiveRecord::Migration
  def change
    add_column :users_answers, :answer_id, :integer
    add_column :users_answers, :user_id, :integer
    add_column :answers, :question_id, :integer
    add_column :answers, :photo_id, :integer
    add_column :questions, :questionset_id, :integer
    add_column :users_test_stats, :user_id, :integer
    add_column :users_test_stats, :question_id, :integer

  end
end
