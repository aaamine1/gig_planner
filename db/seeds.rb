# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'date'
require 'rubocop-faker'

User.create(email: "a.a@a.a", password: "123123")
User.create(email: "b.b@b.b", password: "123123")
User.create(email: "c.c@c.c", password: "123123")
User.create(email: "d.d@d.d", password: "123123")
User.create(email: "e.e@e.e", password: "123123")

locations = ["Anneessens, 1000 Brussels", "Rue Van Artevelde 45, 1000 Bruxelles",
  "DE SINGEL, Desguinlei, Antwerpen ",
  "BOURLA SCHOUWBURG, Komedieplaats, Antwerp",
  "Bd Emile de Laveleye 191, 4020 Liège",
  "Rue Méan 27, 4020 Liège",
  "Rue Roture 13, 4020 Liège",
  "50 Bd Voltaire, 75011 Paris, France",
  "120 Blvd Marguerite de Rochechouart, 75018 Paris, France",
  "211 Av. Jean Jaurès, 75019 Paris, France",
  "Brabantlaan 1, 3001 Leuven",
  "Martelarenplein 12, 3000 Leuven",
  "Hurstweg 8, 9000 Gent",
  "Emile Braunplein 39, 9000 Gent",
  "Ancienne Belgique, Boulevard Anspach, Brussels", "16 Villa Gaudelet, Paris"]

10.times do Venue.create(
  name: Faker::Space.planet,
  price: [750, 1000, 1250, 1500].sample,
  square_meter: rand(300..1500),
  location: locations.sample,
  capacity: rand(100..1200),
  status: "true", # true = available, false = unavailable
  image_url: Faker::LoremPixel.image(size: "730x411"),
  user: User.all.sample
)
p "done"
end

10.times do
  start = Date.today + rand(0..150).day
  Booking.create!(
    status: "pending",
    start_date: start,
    end_date: start + 1.day,
    user: User.all.sample,
    venue: Venue.all.sample
   )
end
