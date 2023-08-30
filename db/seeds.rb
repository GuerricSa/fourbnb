# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
require "open-uri"

CITIES = %w[Paris Lyon Blois Rennes Lille Marseille]

puts "Destroying all users and ovens..."
Oven.destroy_all
User.destroy_all
puts "Done!"

puts "Creating users..."
25.times do
  user = User.new(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    password: "123456"
  )
  file = URI.open("https://source.unsplash.com/random/?avatar,face")
  user.avatar.attach(io: file, filename: "avatar#{user.id}.png", content_type: "image/png")
  user.save
end
puts "Completed!"

puts "Creating ovens..."
User.all.each do |user|
  (1..3).to_a.sample.times do
    oven = Oven.new(
      brand: Faker::Appliance.brand,
      user_id: user.id,
      address: "#{Faker::Address.street_address}, #{CITIES.sample}",
      description: Faker::Lorem.sentence(word_count: (50..80).to_a.sample),
      title: "#{Faker::Adjective.positive} #{["four", "grill"].sample}",
      price: (5..30).to_a.sample
    )
    [1, 5].sample.times do
      # index = (0..8).to_a.sample
      file = URI.open("https://source.unsplash.com/random/?oven")
      oven.photos.attach(io: file, filename: "photo#{oven.id}.png", content_type: "image/png")
      oven.save
    end
  end
end
puts "Finished!"

puts "Creating 'Maité'..."
truc = User.new(
  email: "maite@gmail.com",
  first_name: "Maité",
  password: "123456"
)
truc_avatar = URI.open("https://www.parismatch.com/lmnr/var/pm/public/media/image/2022/03/02/07/La-Cuisine-des-Mousquetaires-Que-devient-la-cuisiniere-Maite.jpg?VersionId=Bx1BN4WaCcUbOhuMd3mq5Y9ijidHeqJm")
truc.avatar.attach(io: truc_avatar, filename: "maite.png", content_type: "image/png")
truc.save
puts "'Maité' is alive!"
