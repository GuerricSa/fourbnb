# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

puts "Destroying all users and ovens"
Oven.destroy_all
User.destroy_all
puts "Done!"

puts "Creating users"
5.times do
  user = User.new(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    password: "123456"
  )
  user.save!
end
puts "Completed!"

puts "Creating ovens"
User.all.each do |user|
  number_of_times = (0..3).to_a.sample
  number_of_times.times do
    Oven.create(
      brand: Faker::Appliance.brand,
      user_id: user.id,
      address: Faker::Address.full_address,
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      title: Faker::Commerce.product_name,
      price: (1..50).to_a.sample
    )
  end
end
puts "Finished!"
