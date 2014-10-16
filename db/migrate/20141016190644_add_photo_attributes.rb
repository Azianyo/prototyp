class AddPhotoAttributes < ActiveRecord::Migration
  def change
    add_column :photos, :age, :integer
    add_column :photos, :sex, :string
    add_column :photos, :location, :string
    add_column :photos, :diameter, :integer
    add_column :photos, :elevation, :string
    add_column :photos, :global_feature, :string
    add_column :photos, :pigment_network, :string
    #add_column :photos, :dots_and_globules, :string
    add_column :photos, :streaks, :string
    add_column :photos, :blue_whitish_veil, :string
    add_column :photos, :pigmentation, :string
    add_column :photos, :hypopigmentation, :string
    add_column :photos, :regression_structures, :string
    add_column :photos, :vascular_structures, :string
    add_column :photos, :other_criteria, :string
    add_column :photos, :level_of_difficulty, :string
    add_column :photos, :management, :string
  end
end
