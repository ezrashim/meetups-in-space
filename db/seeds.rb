# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Example:
#
#   Person.create(first_name: 'Eric', last_name: 'Kelly')
require 'faker'


100.times do
  User.create(
  provider: "#{Faker::Hacker.noun}",
  uid: "#{Faker::Number.number(4)}",
  username: "#{Faker::Hacker.noun}",
  email: "#{Faker::Internet.free_email}",
  avatar_url: "#{Faker::Internet.url}"
  )
end

100.times do
  Meetup.create(
    name: "#{Faker::Hacker.adjective} #{Faker::Hacker.noun}",
    description: "#{Faker::Hacker.say_something_smart}",
    location: "#{Faker::Hacker.noun}",
    creator: "#{Faker::Hacker.noun}"
  )
end

100.times do
  Membership.create(
  user_id: rand(100) + 1,
  meetup_id: rand(100) + 1
  )
end
