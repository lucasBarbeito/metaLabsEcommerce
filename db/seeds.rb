# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


30.times do |i|
  Product.create(
    name: "Product #{i + 1}",
    description: "Lorem ipsum dolor sit amet",
    price: rand(100.0..999.9).round(2),
    stock: rand(1..14)
  )
end
