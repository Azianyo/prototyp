class RenameAsymmetryInPhotos < ActiveRecord::Migration
  def change
    rename_column :photos, :assymetry, :asymmetry
  end
end
