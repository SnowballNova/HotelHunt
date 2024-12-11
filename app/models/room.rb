class Room < ApplicationRecord
  belongs_to :hotel
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings

  validates :price_per_night, presence: true, numericality: { greater_than: 0 }
  validates :capacity, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
