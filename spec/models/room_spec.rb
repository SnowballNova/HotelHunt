require 'rails_helper'

RSpec.describe "Room", :type => :model do
  it "should exist" do
    expect(defined?(Room)).to be_truthy
  end

  describe "Columns and data types" do
     {
      "price_per_night" => [:integer, :float],
      "capacity" => [:integer],
      "hotel_id" => [:integer]
     }.each do |column_name, types|
      it "should have a #{column_name} column" do
        expect(Room.column_names).to include column_name
      end

      it "#{column_name} column should store a #{types.join(" or ")}" do
        expect(types).to include(Room.columns.find { |column| column.name == column_name }.type)
      end
    end
  end

  describe "Associations" do
    it "should belong to a hotel" do
      expect(Room.reflect_on_association(:hotel).macro).to eq(:belongs_to)
    end

    it "should have many bookings" do
      expect(Room.reflect_on_association(:bookings).macro).to eq(:has_many)
    end

    it "should have a dependent destroy on bookings" do
      client = User.create(email: "client@booking.com", password: "passw0rd")
      hotel = Hotel.create(name: "Le Wagon Hotel", address: "16 villa Gaudelet, 75011 Paris")
      room = Room.create(capacity: 2, price_per_night: 100, hotel: hotel)
      Booking.create(user: client, room: room, starts_at: Time.zone.now, ends_at: Time.zone.now + 1.day)
      expect { room.destroy }.to change { Booking.count }.by(-1)
    end
  end

  describe "Validations" do
    %i[price_per_night capacity].each do |column_name|
      it "can't be saved without a #{column_name}" do
        room = Room.new
        room.valid?
        expect(room.errors.messages[column_name]).to include "can't be blank"
      end
    end

    it "can't be saved with a price_per_night lower than zero" do
      room = Room.new(price_per_night: 0)
      room.valid?
      expect(room.errors.messages[:price_per_night]).to include "must be greater than 0"
    end

    it "can't be saved with a capacity than is not an integer" do
      room = Room.new(capacity: 3.5)
      room.valid?
      expect(room.errors.messages[:capacity]).to include "must be an integer"
    end
  end
end
