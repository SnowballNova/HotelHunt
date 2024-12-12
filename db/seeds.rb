# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Clear existing data
puts "Cleaning database..."
Booking.destroy_all
Room.destroy_all
Hotel.destroy_all
User.destroy_all

puts "Creating hotels..."

hotels = [
  {
    name: "Le Petit Château",
    address: "15 Rue du Faubourg Saint-Honoré, 75008 Paris"
  },
  {
    name: "La Belle Époque",
    address: "23 Avenue de la Californie, 06200 Nice"
  },
  {
    name: "Le Coq Dormant",
    address: "45 Rue Paradis, 13006 Marseille"
  },
  {
    name: "L'Auberge des Rêves",
    address: "8 Place de la Bourse, 33000 Bordeaux"
  },
  {
    name: "Le Château des Nuages",
    address: "12 Rue des Carmélites, 69001 Lyon"
  },
  {
    name: "La Maison Douce",
    address: "3 Rue du Vieux Marché aux Vins, 67000 Strasbourg"
  }
]

hotels.each do |hotel_data|
  hotel = Hotel.create!(hotel_data)
  puts "Created #{hotel.name}"

  # Rooms for each hotel
  rooms = [
    {
      capacity: 2,
      price_per_night: rand(45..65)
    },
    {
      capacity: 3,
      price_per_night: rand(65..85)
    },
    {
      capacity: 4,
      price_per_night: rand(85..105)
    }
  ]

  rooms.each do |room_data|
    room = Room.create!(
      capacity: room_data[:capacity],
      price_per_night: room_data[:price_per_night],
      hotel: hotel
    )
    puts "Created room for #{room.capacity} people in #{hotel.name}"
  end
end

puts "Creating user..."
User.create!(
  email: "test@test.com",
  password: "password"
)

puts "Finished!"
