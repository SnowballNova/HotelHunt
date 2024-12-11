class Room < ApplicationRecord
  belongs_to :hotel
  has_many :bookings
  has_many :users, through: :bookings

  validates :capacity, presence: { message: "Capacity is required" }
  validates :capacity, numericality: {
    only_integer: true,
    greater_than: 0,
    message: "Capacity must be a positive integer"
  }

  validates :price_per_night, presence: { message: "Price per night is required" }
  validates :price_per_night, numericality: {
    greater_than: 0,
    message: "Price per night must be greater than zero"
  }
end
