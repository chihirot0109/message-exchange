require 'faker'

puts "Start seeding"

50.times do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'secret',
    password_confirmation: 'secret',
    confirmed_at: DateTime.now
  )
end

puts "Completed seeding. Total #{User.count} users."
