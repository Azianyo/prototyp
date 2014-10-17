class AddColumnDotsGlobules < ActiveRecord::Migration
  def change
    add_column :photos, :dots_globules, :string
  end
end
