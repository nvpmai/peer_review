50.times do
  Campaign.create(name: Faker::Hacker.say_something_smart)
end

20.times do
  User.create(email: Faker::Internet.email, name: Faker::Name.name, password: '1234')
end
