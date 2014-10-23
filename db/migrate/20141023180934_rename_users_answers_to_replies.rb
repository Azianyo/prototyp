class RenameUsersAnswersToReplies < ActiveRecord::Migration
  def change
    rename_table :users_answers, :replies
  end
end
