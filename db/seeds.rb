# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'open-uri'

puts "Deleting seeds..."
User.destroy_all
Island.destroy_all
Booking.destroy_all
Review.destroy_all
puts "Seeds deleted!"

puts "Creating seeds..."
pedro = User.create!(username: "Peeta98", email: "pedro99@gmail.com", password: "secret") # User who owns the Island
klevion = User.create!(username: "Klevion", email: "klevion99@gmail.com", password: "secret") # User who rents the Island
terceira = Island.create!(title: "Terceira Island", address: "Terceira, Azores, Portugal", description: "Best Island in the Universe", price_per_night: 20000, user: pedro)
url1 = Cloudinary::Utils.cloudinary_url("Terceira2_zvnbne")
url2 = Cloudinary::Utils.cloudinary_url("Terceira4_v1kca1")
url3 = Cloudinary::Utils.cloudinary_url("Terceira3_dapyar")
url4 = Cloudinary::Utils.cloudinary_url("Terceira1_fw9goo")

file = URI.open(url1)
terceira.photos.attach(io: file, filename: "terceira.png", content_type: "image/png")
file2 = URI.open(url2)
terceira.photos.attach(io: file2, filename: "terceira2.png", content_type: "image/png")
file3 = URI.open(url3)
terceira.photos.attach(io: file3, filename: "terceira3.png", content_type: "image/png")
file4 = URI.open(url4)
terceira.photos.attach(io: file4, filename: "terceira4.png", content_type: "image/png")
terceira.save!
puts "1st Island done"

terceira2 = Island.create!(title: "Terceira Island", address: "Terceira, Azores, Portugal", description: "Best Island in the Universe", price_per_night: 20000, user: pedro)
file = URI.open(url1)
terceira2.photos.attach(io: file, filename: "terceira.png", content_type: "image/png")
file2 = URI.open(url2)
terceira2.photos.attach(io: file2, filename: "terceira2.png", content_type: "image/png")
file3 = URI.open(url3)
terceira2.photos.attach(io: file3, filename: "terceira3.png", content_type: "image/png")
file4 = URI.open(url4)
terceira2.photos.attach(io: file4, filename: "terceira4.png", content_type: "image/png")
terceira2.save!
puts "2nd Island done"

terceira3 = Island.create!(title: "Terceira Island", address: "Terceira, Azores, Portugal", description: "Best Island in the Universe", price_per_night: 20000, user: pedro)
file = URI.open(url1)
terceira3.photos.attach(io: file, filename: "terceira.png", content_type: "image/png")
file2 = URI.open(url2)
terceira3.photos.attach(io: file2, filename: "terceira2.png", content_type: "image/png")
file3 = URI.open(url3)
terceira3.photos.attach(io: file3, filename: "terceira3.png", content_type: "image/png")
file4 = URI.open(url4)
terceira3.photos.attach(io: file4, filename: "terceira4.png", content_type: "image/png")
terceira3.save!
puts "3nd Island done"

terceira4 = Island.create!(title: "Terceira Island", address: "Terceira, Azores, Portugal", description: "Best Island in the Universe", price_per_night: 20000, user: pedro)
file = URI.open(url1)
terceira4.photos.attach(io: file, filename: "terceira.png", content_type: "image/png")
file2 = URI.open(url2)
terceira4.photos.attach(io: file2, filename: "terceira2.png", content_type: "image/png")
file3 = URI.open(url3)
terceira4.photos.attach(io: file3, filename: "terceira3.png", content_type: "image/png")
file4 = URI.open(url4)
terceira4.photos.attach(io: file4, filename: "terceira4.png", content_type: "image/png")
terceira4.save!
puts "4rd Island done"

booking = Booking.create!(start_date: "30/08/2023", end_date: "2/09/2023", user: klevion, island: terceira)
booking2 = Booking.create!(start_date: "30/08/2023", end_date: "2/09/2023", user: klevion, island: terceira2)
booking3 = Booking.create!(start_date: "30/08/2023", end_date: "2/09/2023", user: klevion, island: terceira3)
booking4 = Booking.create!(start_date: "30/08/2023", end_date: "2/09/2023", user: klevion, island: terceira4)
Review.create!(content: "Awesome island with a lot of cows!", rating: 5.0, booking:)
puts "Seeds created!"
