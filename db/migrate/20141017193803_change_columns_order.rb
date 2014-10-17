class ChangeColumnsOrder < ActiveRecord::Migration
  def change
    change_column :photos, :dots_globules, :string, after: :pigment_network
  end
end
