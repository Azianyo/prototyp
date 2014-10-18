# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


paths = Dir.glob(File.join(Rails.root, "lib/assets/photos/*.jpg"))
paths.each do |path|
  photo = Photo.new
  photo.picture = File.open(path)
  photo.save
end
