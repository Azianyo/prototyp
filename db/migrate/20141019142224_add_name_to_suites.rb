class AddNameToSuites < ActiveRecord::Migration
  def change
    add_column :suites, :name, :string
  end
end
