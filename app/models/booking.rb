class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :starts_at, presence: { message: "Start date is required" }
  validates :ends_at, presence: { message: "End date is required" }
  validate :end_date_after_start_date

  private

  def end_date_after_start_date
    return if ends_at.blank? || starts_at.blank?

    if ends_at < starts_at
      errors.add(:ends_at, "End date must be after start date")
    end
  end
end
