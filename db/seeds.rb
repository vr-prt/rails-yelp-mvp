# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Deleting restaurants and reviews..."
Review.delete_all
Restaurant.delete_all

puts "Creating restaurants and reviews..."

10.times do
  resto = Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    category: Restaurant::RESTAURANT_CATEGORIES.sample
  )

  puts "#{resto.name} was created at id #{resto.id}"

  3.times do
    review = Review.new(content: Faker::Restaurant.review, rating: rand(0..5))
    review.restaurant = resto
    review.save!
    puts "Review with rating #{review.rating} linked to #{review.restaurant.name} was created"
  end
end

puts "All done!"
