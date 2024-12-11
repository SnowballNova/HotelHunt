class RemoveBedroomsTable < ActiveRecord::Migration[7.0]
  def up
    drop_table :bedrooms if table_exists?(:bedrooms)
  end

  def down
    create_table :bedrooms do |t|
      t.integer :capacity
      t.decimal :price_night, precision: 10, scale: 2
      t.decimal :price_discounted, precision: 10, scale: 2
      t.string :address
      t.string :city
      t.string :name
      t.text :description
      t.string :image_url
      t.string :hotel_name
      t.string :status

      t.timestamps
    end
  end
end
