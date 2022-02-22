# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'date'

User.create(email: "a.a@a.a", password: "zebra")
User.create(email: "b.b@b.b", password: "lion")
User.create(email: "c.c@c.c", password: "antilope")
User.create(email: "d.d@d.d", password: "fish")

10.times do Venue.create!(
  name: Faker::Space.planet,
  price: [750, 1000, 1250, 1500].sample,
  square_meter: rand(300..1500),
  location: ["Brussels", "Antwerp", "Leuven", "Ghent"].sample,
  capacity: rand(100..1200),
  status: "true", # true = available, false = unavailable
  user: User.all.sample
)
end

10.times do Booking.create!(
  status: "pending",
  start_date: Date.today,
  end_date: Date.today + 1.day,
  user: User.all.sample,
  venue: Venue.all.sample
)
end
