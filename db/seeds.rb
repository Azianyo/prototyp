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

Suite.create!([
  {name: "7-point checklist"},
  {name: "ABCD method"},
  {name: "Type of disease"}
])
Answer.create!([
  {content: "diffuse regular", anything: nil, question_id: 2, photo_id: 16},
  {content: "regular", anything: nil, question_id: 3, photo_id: 16},
  {content: "regular", anything: nil, question_id: 4, photo_id: 16},
  {content: "diffuse regular", anything: nil, question_id: 5, photo_id: 16},
  {content: "regular", anything: nil, question_id: 2, photo_id: 16}
])
UsersTestStat.create!([
  {points: 5, user_id: 1, question_id: 1}
])
Question.create!([
  {content: "Evaluate the pigmentation of the nevus", suite_id: 3},
  {content: "Evaluate the blue-whitish veil of the nevus", suite_id: 3},
  {content: "Evaluate the pigment network of the nevus", suite_id: 3}
])
Reply.create!([
  {answer_id: 2, user_id: 2},
  {answer_id: 2, user_id: 2},
  {answer_id: 2, user_id: 2},
  {answer_id: 2, user_id: 2},
  {answer_id: 2, user_id: 2}
])
