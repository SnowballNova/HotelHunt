class ChangeRoomPricePerNightToFloat < ActiveRecord::Migration[7.0]
  def change
    change_column :rooms, :price_per_night, :float
  end
end
