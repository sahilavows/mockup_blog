# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
1110.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    state: Faker::Address.state,
    city: Faker::Address.city,
    country: Faker::Address.country,
    phone_number: Faker::PhoneNumber.phone_number
  )
end
1110.times do
  Report.create(
    user_id: Faker::Number.between(from: 1, to: 1010), # Assuming user IDs 1 to 10 exist
    passed: Faker::Boolean.boolean,
    doctor_name: Faker::Name.name,
    visa_type: Faker::Lorem.word
  )
end
Report.all.each {|i| i.update(purchased_insurence: [true,false].shuffle.first)}
100.times do 
  Registration.generate_fake_data
end 
