class CreateBedrooms < ActiveRecord::Migration[7.0]
  def change
    create_table :bedrooms do |t|
      t.integer :capacity
      t.decimal :price_night
      t.decimal :price_discounted
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
