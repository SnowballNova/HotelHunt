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

# Create sample data
puts "Creating hotels..."
hotels = [
  { name: "Luxury Hotel", address: "123 Main St, Paris" },
  { name: "Cozy Inn", address: "456 Oak St, London" },
  { name: "Beach Resort", address: "789 Palm Ave, Miami" },
  { name: "Mountain Lodge", address: "321 Pine Rd, Aspen" }
]

hotels.each do |hotel_data|
  hotel = Hotel.create!(hotel_data)
  puts "Created #{hotel.name}"

  # Create 3 rooms for each hotel
  puts "Creating rooms for #{hotel.name}..."
  3.times do |i|
    room = Room.create!(
      hotel: hotel,
      price_per_night: rand(100..500),
      capacity: rand(1..4)
    )
    puts "Created room #{i + 1} for #{hotel.name}"
  end
end

puts "Finished!"
