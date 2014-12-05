class AddAbcdCriteriaToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :assymetry, :integer
    add_column :photos, :border, :integer
    add_column :photos, :color, :integer
    add_column :photos, :dermoscopic_structures, :integer
  end
end
