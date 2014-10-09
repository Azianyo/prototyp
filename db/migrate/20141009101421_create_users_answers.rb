class CreateUsersAnswers < ActiveRecord::Migration
  def change
    create_table :users_answers do |t|

      t.timestamps
    end
  end
end
