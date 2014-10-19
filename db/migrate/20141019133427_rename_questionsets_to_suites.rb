class RenameQuestionsetsToSuites < ActiveRecord::Migration
  def change
    rename_table :questionsets, :suites
    rename_column :questions, :questionset_id, :suite_id
  end
end
