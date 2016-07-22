User.create(username: "tom", password: "password")

19.times do
  User.create(username: Faker::Name.name, password: "password")
end

user_ids = User.all.pluck(:id)

100.times do
  Post.create(title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph, user_id: user_ids.sample)
end

200.times do
  Comment.create(text: Faker::Lorem.paragraph, post_id: rand(1..100), user_id: user_ids.sample)
end