class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name

      t.timestamps
    end

  # if !Photo.all
    names = Dir.glob(File.join(Rails.root,"app/assets/images/photos/*.{jpg,png}"))
    names.each do |name|
      image_tag("photos/#{name}")
       photo = Photo.new
       photo.name = n
       photo.save
   end
  # end
 end
end
