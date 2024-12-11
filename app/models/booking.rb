class Booking < ApplicationRecord
  belongs_to :bedroom
  belongs_to :user
end
