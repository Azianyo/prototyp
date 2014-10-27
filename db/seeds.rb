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
User.create!([
  {name: "Ania", email: "ania@onet.pl", encrypted_password: "", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil},
  {name: nil, email: "user@example.com", encrypted_password: "$2a$10$a7swhdPdhJGULypHHaF0hu1JD1zMzMCX2aOXGFBUp.gH5Rcy8uRda", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 5, current_sign_in_at: "2014-10-26 10:41:02", last_sign_in_at: "2014-10-26 10:27:56", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"},
  {name: nil, email: "admin@example.com", encrypted_password: "$2a$10$/.urj7leD3vpAaVWlaYS5u3dJjTgTE7i.mkTfpVCLin6/.9/f0Uo.", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2014-10-18 21:16:54", last_sign_in_at: "2014-10-18 21:16:54", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"}
])
AdminUser.create!([
  {email: "admin@example.com", encrypted_password: "$2a$10$7GMRHnDPqQs6yy1.7mf16eMU/8A5vwAQHZA5fDBm4h5Cf19BD6MSK", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2014-10-16 18:16:19", last_sign_in_at: "2014-10-15 20:23:55", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"}
])
Suite.create!([
  {name: "7-point checklist"},
  {name: "ABCD method"},
  {name: "Type of disease"}
])
Photo.create!([
  {name: nil, age: nil, sex: nil, location: nil, diameter: nil, elevation: nil, global_feature: nil, pigment_network: nil, streaks: nil, blue_whitish_veil: nil, pigmentation: nil, hypopigmentation: nil, regression_structures: nil, vascular_structures: nil, other_criteria: nil, level_of_difficulty: nil, management: nil, dots_globules: nil, picture: "3.jpg"},
  {name: nil, age: nil, sex: nil, location: nil, diameter: nil, elevation: nil, global_feature: nil, pigment_network: nil, streaks: nil, blue_whitish_veil: nil, pigmentation: nil, hypopigmentation: nil, regression_structures: nil, vascular_structures: nil, other_criteria: nil, level_of_difficulty: nil, management: nil, dots_globules: nil, picture: "2.jpg"},
  {name: nil, age: nil, sex: nil, location: "lower_limbs", diameter: nil, elevation: nil, global_feature: nil, pigment_network: nil, streaks: nil, blue_whitish_veil: nil, pigmentation: nil, hypopigmentation: nil, regression_structures: nil, vascular_structures: nil, other_criteria: nil, level_of_difficulty: nil, management: nil, dots_globules: nil, picture: "5.jpg"},
  {name: nil, age: nil, sex: nil, location: nil, diameter: nil, elevation: nil, global_feature: nil, pigment_network: nil, streaks: nil, blue_whitish_veil: nil, pigmentation: nil, hypopigmentation: nil, regression_structures: nil, vascular_structures: nil, other_criteria: nil, level_of_difficulty: nil, management: nil, dots_globules: nil, picture: "1.jpg"},
  {name: nil, age: nil, sex: nil, location: nil, diameter: nil, elevation: nil, global_feature: nil, pigment_network: nil, streaks: nil, blue_whitish_veil: nil, pigmentation: nil, hypopigmentation: nil, regression_structures: nil, vascular_structures: nil, other_criteria: nil, level_of_difficulty: nil, management: nil, dots_globules: nil, picture: "6.jpg"},
  {name: nil, age: nil, sex: nil, location: nil, diameter: nil, elevation: nil, global_feature: nil, pigment_network: nil, streaks: nil, blue_whitish_veil: nil, pigmentation: nil, hypopigmentation: nil, regression_structures: nil, vascular_structures: nil, other_criteria: nil, level_of_difficulty: nil, management: nil, dots_globules: nil, picture: "4.jpg"},
  {name: nil, age: nil, sex: nil, location: "upper_body", diameter: nil, elevation: nil, global_feature: nil, pigment_network: nil, streaks: nil, blue_whitish_veil: nil, pigmentation: nil, hypopigmentation: nil, regression_structures: nil, vascular_structures: nil, other_criteria: nil, level_of_difficulty: "high", management: nil, dots_globules: nil, picture: "7.jpg"}
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
