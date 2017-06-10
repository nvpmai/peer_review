50.times do
  Campaign.create(name: Faker::Company.catch_phrase)
end

50.times do
  User.create(email: Faker::Internet.email, name: Faker::Name.name, password: '123456', is_fake: true)
end
