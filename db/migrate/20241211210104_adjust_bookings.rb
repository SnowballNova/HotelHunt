class AdjustBookings < ActiveRecord::Migration[7.0]
  def change
    # Remove old columns if they exist
    remove_column :bookings, :bedroom_id if column_exists?(:bookings, :bedroom_id)

    # Add new columns
    add_reference :bookings, :room, null: false, foreign_key: true unless column_exists?(:bookings, :room_id)

    # Rename columns if needed
    rename_column :bookings, :start_date, :starts_at if column_exists?(:bookings, :start_date)
    rename_column :bookings, :end_date, :ends_at if column_exists?(:bookings, :end_date)
  end
end
