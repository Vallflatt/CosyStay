# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "faker"
Flat.destroy_all if Rails.env.development?
Booking.destroy_all if Rails.env.development?
User.destroy_all if Rails.env.development?

puts "after destroy"

puts "count user: #{User.count}"
puts "count flat: #{Flat.count}"
puts "count booking: #{Booking.count}"

10.times do
  User.create!(
    email: Faker::Internet.email,
    password: '123456',
  )
end


50.times do
  title = Faker::Company.name
  street = Faker::Address.street_address

  # Generate a random city
  city = Faker::Address.city

  country = Faker::Address.country

  description = Faker::Lorem.paragraph
  latitude = (rand(-100..100).fdiv(100) + 46.5436672).round(7)
  longitude = (rand(-100..100).fdiv(100) + 6.5961984).round(7)
  #lng 6.5961984 lat 46.5436672

  # Combine the street address, city, state, and zip code to create a full address
  #address = "#{street_address}, #{city}, #{state} #{zip_code}"

  # Generate a random image URL of a house using Faker's image method
  image_url = Faker::LoremFlickr.image(size: "600x400", search_terms: ['house'])
  price = Faker::Commerce.price(range: 80..400, )
  # Create a new instance of the Airbnb model and save it to the database

  user = User.all.sample

  Flat.create!(
    title:,
    street: ,
    city: ,
    image_url: ,
    country: ,
    price:,
    description:,
    latitude:,
    longitude:,
    user:
  )
end
puts "count flat: #{Flat.count}"


Flat.all.each do |flat|
  user = User.where.not(id: flat.user_id).sample
  start_date = Date.today + rand(1..30).days
  end_date = start_date + rand(1..30).days
  confirmed = [true, false].sample
  Booking.create!(user:, start_date:, end_date:, flat:, confirmed:)
end
