require 'faker'

puts "Start seeding"

30.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: 'secret',
    password_confirmation: 'secret',
    confirmed_at: DateTime.now
  )
end

puts "Completed seeding. Total #{User.count} users."
