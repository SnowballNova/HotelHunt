class Hotel < ApplicationRecord
  has_many :rooms, dependent: :destroy

  validates :name, presence: { message: "Hotel name is required" }
  validates :address, presence: { message: "Hotel address is required" }
end
