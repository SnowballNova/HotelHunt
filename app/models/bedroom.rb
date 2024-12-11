class Bedroom < ApplicationRecord
  include PgSearch::Model

  pg_search_scope :search_by_city,
    against: [:city],
    using: {
      tsearch: { prefix: true }
    }

  # Add more search fields if needed:
  # pg_search_scope :global_search,
  #   against: [:city, :name, :hotel_name],
  #   using: {
  #     tsearch: { prefix: true }
  #   }
end
