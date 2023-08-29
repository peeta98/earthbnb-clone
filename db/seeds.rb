# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Deleting seeds..."
User.destroy_all
Island.destroy_all
Booking.destroy_all
Review.destroy_all
puts "Seeds deleted!"

puts "Creating seeds..."
pedro = User.create!(username: "Peeta98", email: "pedro99@gmail.com", password: "secret")
klevion = User.create!(username: "Klevion", email: "klevion99@gmail.com", password: "secret")
User.create!(username: "Gonçalo", email: "Goncalo99@gmail.com", password: "secret")
terceira = Island.create!(title: "Best island in the azores", address: "Portugal, Azores, Terceira", description: "Best Island in the Universe", price_per_night: 15, user:pedro)
newbooking = Booking.create!(start_date: "29/08/2023", end_date: "30/08/2023", user: klevion, island: terceira)
Review.create!(content: "Best island everrrrr", rating: 5.0, booking: newbooking)
puts "Seeds created!"
