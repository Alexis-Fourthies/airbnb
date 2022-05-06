# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all
City.destroy_all
Listing.destroy_all
Reservation.destroy_all

10.times do
    city = City.create(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
end

20.times do
    user = User.create(name: Faker::Name.first_name, email: Faker::Internet.email, phone_number: "0650505050", description: nil)
end

50.times do
    listing = Listing.create(user: User.all.sample, city: City.all.sample, description: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec qu", price: Faker::Number.between(from: 10, to: 100), available_beds: Faker::Number.between(from: 1, to: 4), has_wifi: Faker::Boolean.boolean, welcome_message: Faker::Lorem.sentence)
end

for i in 1..50 do
    start_date = Faker::Date.between(from: Date.today, to: Date.today + 30)
    end_date = start_date + Faker::Number.between(from: 1, to: 30)
    Reservation.create(listing: Listing.all.sample, user: User.all.sample, start_date: start_date, end_date: end_date)
end