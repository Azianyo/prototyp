class AddDiseaseNameToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :disease_name, :string
  end
end
