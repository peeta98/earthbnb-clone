# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'open-uri'

puts "Deleting seeds..."
Review.destroy_all
Booking.destroy_all
Island.destroy_all
User.destroy_all
puts "Seeds deleted!"

#  ----- Seeding instances of User -----
puts "Creating 5 users..."
pedro = User.create!(username: "Peeta98", email: "pedro99@gmail.com", password: "secret")
puts "User 1 created!"
klevion = User.create!(username: "KlevionBMW", email: "klevion99@gmail.com", password: "secret")
puts "User 2 created!"
ayub = User.create!(username: "AyubHassan", email: "ayub99@gmail.com", password: "secret")
puts "User 3 created!"
gonçalo = User.create!(username: "Gonçalo", email: "gonçalo99@gmail.com", password: "secret")
puts "User 4 created!"
kevin = User.create!(username: "KevinAjax", email: "kevin99@gmail.com", password: "secret")
puts "User 5 created!"

# ----- Seeding istances of Island -----
puts "Creating 7 islands..."
terceira = Island.create!(
  title: "Terceira",
  address: "Terceira, Azores, Portugal",
  description: "Stunning little island in the middle of the vulcanic ocean.
  Known for its natural landmarks and cultural festivals!",
  price_per_night: 20_000,
  user: pedro # This user is the owner of the Island!
)
puts "Island 1 created!"

malta = Island.create!(
  title: "Malta",
  address: "Malta, Europe",
  description: "Malta is famous for its beautiful architecture, scenic cliffs, breathtaking coastline and dive sites.",
  price_per_night: 35_000,
  user: klevion
)
puts "Island 2 created!"

england = Island.create!(
  title: "England",
  address: "England, United Kingdom, Europe",
  description: "Laced by great rivers and small streams, England is a fertile land,
  and the generosity of its soil has supported a thriving agricultural economy for millennia",
  price_per_night: 50_000,
  user: ayub
)
puts "Island 3 created!"

australia = Island.create!(
  title: "Australia",
  address: "Australia, Asia",
  description: "Australia is known for many things, including swathes of tropical beaches, marine reserves,
  aboriginal culture, cute koalas, rolling wine country, and lush rainforests.",
  price_per_night: 45_000,
  user: kevin
)
puts "Island 4 created!"

hawaii = Island.create!(
  title: "Hawaii",
  address: "Hawaii, United States, America",
  description: "Hawaii is known for its beautiful beaches, its laid-back lifestyle,
  and its delicious food. You are in for a treat after exploring the mountains or surfing the waves.",
  price_per_night: 60_000,
  user: gonçalo
)
puts "Island 5 created!"

corvo = Island.create!(
  title: "Corvo",
  address: "Corvo, Azores, Portugal",
  description: "Together with Flores, a few kilometers away, Corvo is considered a World Biosphere Reserve by UNESCO.
  Corvo is known as one of the best places in the world for bird watching and hiking.",
  price_per_night: 5_000,
  user: pedro
)
puts "Island 6 created!"

bora = Island.create!(
  title: "Bora Bora",
  address: "Bora Bora, Leeward Islands, French Polynesia",
  description: "What is so beautiful about Bora Bora?
  The island of Bora Bora is a honeymooner's paradise. The ultimate setting for romance
  is largely mainly due to theiconic beauty of Mount Otemanu.",
  price_per_night: 65_000,
  user: kevin
)
puts "Island 7 created!"

# ----- Attaching some photos to the Islands! -----
puts "Attaching photos to Terceira..."
url1 = Cloudinary::Utils.cloudinary_url("Terceira2_zvnbne")
url2 = Cloudinary::Utils.cloudinary_url("Terceira4_v1kca1")
url3 = Cloudinary::Utils.cloudinary_url("Terceira3_dapyar")

file = URI.open(url1)
terceira.photos.attach(io: file, filename: "terceira.png", content_type: "image/png")
puts "Photo 1 attached!"
file2 = URI.open(url2)
terceira.photos.attach(io: file2, filename: "terceira2.png", content_type: "image/png")
puts "Photo 2 attached!"
file3 = URI.open(url3)
terceira.photos.attach(io: file3, filename: "terceira3.png", content_type: "image/png")
puts "Photo 3 attached!"
terceira.save!

puts "Attaching photos to Malta..."
url1 = Cloudinary::Utils.cloudinary_url("Malta3_ns9r8z")
url2 = Cloudinary::Utils.cloudinary_url("Malta4_ezun5g")
url3 = Cloudinary::Utils.cloudinary_url("Malta2_sy5yx3")

file = URI.open(url1)
malta.photos.attach(io: file, filename: "malta.jpg", content_type: "image/jpg")
puts "Photo 1 attached!"
file2 = URI.open(url2)
malta.photos.attach(io: file2, filename: "malta2.jpg", content_type: "image/jpg")
puts "Photo 2 attached!"
file3 = URI.open(url3)
malta.photos.attach(io: file3, filename: "malta3.jpg", content_type: "image/jpg")
puts "Photo 3 attached!"
malta.save!

puts "Attaching photos to England..."
url1 = Cloudinary::Utils.cloudinary_url("England1_mvjkkt")
url2 = Cloudinary::Utils.cloudinary_url("England4_vzvl0l")
url3 = Cloudinary::Utils.cloudinary_url("England3_xlxnh4")

file = URI.open(url1)
england.photos.attach(io: file, filename: "england.jpg", content_type: "image/jpg")
puts "Photo 1 attached!"
file2 = URI.open(url2)
england.photos.attach(io: file2, filename: "england2.jpg", content_type: "image/jpg")
puts "Photo 2 attached!"
file3 = URI.open(url3)
england.photos.attach(io: file3, filename: "england3.jpg", content_type: "image/jpg")
puts "Photo 3 attached!"
england.save!

puts "Attaching photos to Australia..."
url1 = Cloudinary::Utils.cloudinary_url("Australia4_kqemui")
url2 = Cloudinary::Utils.cloudinary_url("Australia1_siknza")
url3 = Cloudinary::Utils.cloudinary_url("Australia3_xdfl1i")

file = URI.open(url1)
australia.photos.attach(io: file, filename: "australia.jpg", content_type: "image/jpg")
puts "Photo 1 attached!"
file2 = URI.open(url2)
australia.photos.attach(io: file2, filename: "australia2.jpg", content_type: "image/jpg")
puts "Photo 2 attached!"
file3 = URI.open(url3)
australia.photos.attach(io: file3, filename: "australia3.jpg", content_type: "image/jpg")
puts "Photo 3 attached!"
australia.save!

puts "Attaching photos to Hawaii..."
url1 = Cloudinary::Utils.cloudinary_url("Hawaii1_mnpawe")
url2 = Cloudinary::Utils.cloudinary_url("Hawaii3_okazrl")
url3 = Cloudinary::Utils.cloudinary_url("Hawaii4_g5ucf6")

file = URI.open(url1)
hawaii.photos.attach(io: file, filename: "hawaii.jpg", content_type: "image/jpg")
puts "Photo 1 attached!"
file2 = URI.open(url2)
hawaii.photos.attach(io: file2, filename: "hawaii2.jpg", content_type: "image/jpg")
puts "Photo 2 attached!"
file3 = URI.open(url3)
hawaii.photos.attach(io: file3, filename: "hawaii3.jpg", content_type: "image/jpg")
puts "Photo 3 attached!"
hawaii.save!

puts "Attaching photos to Corvo..."
url1 = Cloudinary::Utils.cloudinary_url("Corvo2_kzjtgb")
url2 = Cloudinary::Utils.cloudinary_url("Corvo1_e2unbo")
url3 = Cloudinary::Utils.cloudinary_url("Corvo3_hyirsd")

file = URI.open(url1)
corvo.photos.attach(io: file, filename: "corvo.jpg", content_type: "image/jpg")
puts "Photo 1 attached!"
file2 = URI.open(url2)
corvo.photos.attach(io: file2, filename: "corvo2.jpg", content_type: "image/jpg")
puts "Photo 2 attached!"
file3 = URI.open(url3)
corvo.photos.attach(io: file3, filename: "corvo3.jpg", content_type: "image/jpg")
puts "Photo 3 attached!"
corvo.save!

puts "Attaching photos to Bora Bora..."
url1 = Cloudinary::Utils.cloudinary_url("Bora2_exxqsp")
url2 = Cloudinary::Utils.cloudinary_url("Bora3_ag2nox")
url3 = Cloudinary::Utils.cloudinary_url("Bora1_pnnn67")

file = URI.open(url1)
bora.photos.attach(io: file, filename: "bora.jpg", content_type: "image/jpg")
puts "Photo 1 attached!"
file2 = URI.open(url2)
bora.photos.attach(io: file2, filename: "bora2.jpg", content_type: "image/jpg")
puts "Photo 2 attached!"
file3 = URI.open(url3)
bora.photos.attach(io: file3, filename: "bora3.jpg", content_type: "image/jpg")
puts "Photo 3 attached!"
bora.save!

# ----- Seeding instances of Booking -----
puts "Creating 5 bookings..."
# The user associated with the booking is the BUYER!
terceira_booking = Booking.create!(start_date: "02/09/2023", end_date: "03/09/2023", user: klevion, island: terceira, status:"Accepted")
puts "Booking 1 created!"
malta_booking = Booking.create!(start_date: "05/09/2023", end_date: "07/09/2023", user: ayub, island: malta, status: "Accepted")
puts "Booking 2 created!"
england_booking = Booking.create!(start_date: "10/09/2023", end_date: "15/09/2023", user: pedro, island: england, status: "Accepted")
puts "Booking 3 created!"
australia_booking = Booking.create!(start_date: "23/09/2023", end_date: "26/09/2023", user: gonçalo, island: australia, status: "Accepted")
puts "Booking 4 created!"
hawaii_booking = Booking.create!(start_date: "30/08/2023", end_date: "2/09/2023", user: kevin, island: hawaii, status: "Accepted")
puts "Booking 5 created!"
corvo_booking = Booking.create!(start_date: "27/08/2023", end_date: "29/08/2023", user: klevion, island: corvo, status: "Accepted")
puts "Booking 6 created!"
bora_booking = Booking.create!(start_date: "30/08/2023", end_date: "31/08/2023", user: pedro, island: bora, status: "Accepted")
puts "Booking 7 created!"

# ----- Seeding instances of Review -----
puts "Creating 5 reviews..."
terceira_review = Review.create!(
  rating: 4.9,
  content: "Loved it here, full of majestic cows and green landscapes! A must visit if you are rich as me 😎",
  booking: terceira_booking
)
puts "Review 1 created!"
malta_review = Review.create!(
  rating: 5.0,
  content: "Fantastic food and people, there are a lot of cool places to visit!",
  booking: malta_booking
)
puts "Review 2 created!"
england_review = Review.create!(
  rating: 2.3,
  content: "Rained the whole time I stayed there, not a very pleasant experience...",
  booking: england_booking
)
puts "Review 3 created!"
australia_review = Review.create!(
  rating: 3.5,
  content: "This island is pretty awesome, if we remove the fact that I was almost bitten by a venomous spider 🕷️",
  booking: australia_booking
)
puts "Review 4 created!"
hawaii_review = Review.create!(
  rating: 5.0,
  content: "Simply amazing... Fantastic beaches, waves... A must vibes experience for every billionaire!",
  booking: hawaii_booking
)
puts "Review 5 created!"
corvo_review = Review.create!(
  rating: 1.2,
  content: "Such a tiny island... Visited everything in 15 minutes LOL",
  booking: corvo_booking
)
puts "Review 6 created!"
bora_review = Review.create!(
  rating: 3.2,
  content: "Nothing special to be very honest, overhyped",
  booking: bora_booking
)
puts "Review 7 created!"
puts "All seeds created successfully!"
