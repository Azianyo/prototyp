ActiveAdmin.register Photo do

  permit_params :name, :age, :sex, :location, :diameter, :elevation, :global_feature,
  :pigment_network, :dots_globules, :streaks, :blue_whitish_veil, :pigmentation,
  :hypopigmentation, :regression_structures, :vascular_structures, :other_criteria,
  :level_of_difficulty, :management

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

end
