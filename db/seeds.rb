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
  photo.name = path.partition("/lib/assets/photos/")[2]
  photo.picture = File.open(path)
  photo.save
end


photo_list = [
  [ "1.jpg", 34, "female", "lower_limbs", 4, "palpable", "homogeneous pattern", "absent", "absent", "absent", "diffuse irregular", "absent", "absent", "absent", "absent", "low", "no further examination", "absent", 0, 8, 3, 4],
  [ "2.jpg", 18, "male", "acral", 5, "nodular", "homogeneous pattern", "absent", "absent", "absent", "diffuse irregular", "absent", "absent", "absent", "absent", "low", "no further examination", "regular", 2, 6, 2, 5],
  [ "3.jpg", 34, "female", "back", 3, "palpable", "homogeneous pattern", "absent", "absent", "absent", "diffuse regular", "absent", "absent", "absent", "absent", "low", "no further examination", "absent", 2, 8, 6, 6],
  [ "4.jpg", 32, "female", "lower_limbs", 8, "nodular", "homogeneous pattern", "absent", "absent", "absent", "diffuse irregular", "absent", "absent", "absent", "absent", "high", "excision", "absent", 2, 7, 5, 3],
  [ "5.jpg", 31, "male", "upper_limbs", 10, "nodular", "homogeneous pattern", "absent", "absent", "absent", "diffuse irregular", "multifocal", "absent", "absent", "absent", "high", "excision", "absent", 2, 6, 4, 3],
  [ "6.jpg", 15, "female", "upper_limbs", 8, "palpable", "homogeneous pattern", "absent", "absent", "absent", "diffuse irregular", "multifocal", "absent", "absent", "absent", "medium", "excision", "absent", 2, 8, 6, 6],
  [ "7.jpg", 46, "female", "lower_limbs", 5, "nodular", "homogeneous pattern", "absent", "absent", "absent", "diffuse regular", "absent", "absent", "absent", "absent", "low", "no further examination", "absent", 2, 4, 3, 3]
]

photo_list.each do |name, age, sex, location, diameter, elevation, global_feature,
 pigment_network, streaks, blue_whitish_veil, pigmentation, hypopigmentation,
  regression_structures, vascular_structures, other_criteria, level_of_difficulty,
   management, dots_globules, asymmetry, border, color, dermoscopic_structures|
    Photo.find_by(:name => name).update( age: age, sex: sex,
     location: location, diameter: diameter, elevation: elevation,
     global_feature: global_feature, pigment_network: pigment_network,
     streaks: streaks, blue_whitish_veil: blue_whitish_veil, pigmentation: pigmentation,
     hypopigmentation: hypopigmentation, regression_structures: regression_structures,
     vascular_structures: vascular_structures, other_criteria: other_criteria,
     level_of_difficulty: level_of_difficulty, management: management,
     dots_globules: dots_globules, asymmetry: asymmetry, border: border, color: color,
     dermoscopic_structures: dermoscopic_structures)
end

Suite.where(name: "7-point checklist").first_or_create
Suite.where(name: "ABCD method").first_or_create
Suite.where(name: "Type of disease").first_or_create


point_check_id = Suite.find_by(name: "7-point checklist").id
ABCD_id = Suite.find_by(name: "ABCD method").id
disease_id = Suite.find_by(name: "Type of disease").id


question_list = [
  [ "Evaluate the pigment network of the nevus:", point_check_id, "pigment_network"],
  [ "Evaluate the streaks of the nevus:", point_check_id, "streaks"],
  [ "Evaluate the blue-whitish veil of the nevus:", point_check_id, "blue_whitish_veil"],
  [ "Evaluate the pigmentation of the nevus:", point_check_id, "pigmentation"],
  [ "Evaluate the regression structures of the nevus:", point_check_id, "regression_structures"],
  [ "Evaluate the vascular structures of the nevus:", point_check_id, "vascular_structures"],
  [ "Evaluate the dots and globules of the nevus:", point_check_id, "dots_globules"],
  [ "What is the proper management of the nevus?", point_check_id, "management"],
  [ "Evaluate the asymmetry of the nevus?", ABCD_id, "asymmetry"],
  [ "Evaluate the border of the nevus?", ABCD_id, "border"],
  [ "Evaluate the color of the nevus?", ABCD_id, "color"],
  [ "Evaluate the dermoscopic structures of the nevus?", ABCD_id, "dermoscopic_structures"],
]

question_list.each do |content, suite_id, parameter|
  Question.where(content: content).first_or_create( suite_id: suite_id, parameter: parameter)
end

Photo.all.pluck(:id).each do |photo_id|
  Question.all.each do |question|
    if(question.suite_id == point_check_id) then
      if (question.parameter == "pigmentation") then
        Answer.where(content: "diffuse regular", question_id: question.id, photo_id: photo_id).first_or_create
        Answer.where(content: "diffuse irregular", question_id: question.id, photo_id: photo_id).first_or_create
      elsif (question.parameter == "management") then
        Answer.where(content: "no further examination", question_id: question.id, photo_id: photo_id).first_or_create
        Answer.where(content: "excision", question_id: question.id, photo_id: photo_id).first_or_create
      else
        Answer.where(content: "absent", question_id: question.id, photo_id: photo_id).first_or_create
        Answer.where(content: "regular", question_id: question.id, photo_id: photo_id).first_or_create
        Answer.where(content: "irregular", question_id: question.id, photo_id: photo_id).first_or_create
      end
    end
    if(question.suite_id == ABCD_id) then
      if (question.parameter == "asymmetry")
        (0..2).each do |no|
        Answer.where(content: "#{no}", question_id: question.id, photo_id: photo_id).first_or_create
        end
      elsif (question.parameter == "border")
        (0..8).each do |no|
        Answer.where(content: "#{no}", question_id: question.id, photo_id: photo_id).first_or_create
        end
      elsif (question.parameter == "color")
        (1..6).each do |no|
        Answer.where(content: "#{no}", question_id: question.id, photo_id: photo_id).first_or_create
        end
      elsif (question.parameter == "dermoscopic_structures")
        (1..5).each do |no|
        Answer.where(content: "#{no}", question_id: question.id, photo_id: photo_id).first_or_create
        end
      end
    end
    if(question.suite_id == disease_id) then
    end
  end
end

# UsersTestStat.create!([
#   {points: 5, user_id: 1, question_id: 1}
# ])

# Reply.create!([
#   {answer_id: 2, user_id: 2},
#   {answer_id: 2, user_id: 2},
#   {answer_id: 2, user_id: 2},
#   {answer_id: 2, user_id: 2},
#   {answer_id: 2, user_id: 2}
# ])
