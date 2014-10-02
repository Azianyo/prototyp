class AddAnythingToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :anything, :string
  end
end
