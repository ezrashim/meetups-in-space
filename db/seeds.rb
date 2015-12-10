# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Example:
#
#   Person.create(first_name: 'Eric', last_name: 'Kelly')
# require 'faker'
#
#
# 100.times do
#   User.create(
#   provider: "Github",
#   uid: Faker::Internet.password(8),
#   username: Faker::Internet.user_name,
#   email: Faker::Internet.free_email,
#   avatar_url: Faker::Avatar.image
#   )
# end
#
# 100.times do
#   Meetup.create(
#     name: "#{Faker::Hacker.adjective} #{Faker::Hacker.noun}",
#     description: Faker::Lorem.sentence,
#     location: "#{Faker::Address.street_address}, #{Faker::Address.city}, #{Faker::Address.state}",
#     creator: User.offset(rand(User.count)).first
#   )
# end
#
# 100.times do
#   Membership.find_or_create_by(
#   user_id: Faker::Number.between(1, 100),
#   meetup_id: Faker::Number.between(1, 100)
#   )
# end
