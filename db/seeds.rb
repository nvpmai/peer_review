50.times do
  Campaign.create(name: Faker::Hacker.say_something_smart)
end
