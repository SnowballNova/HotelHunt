require 'rails_helper'

RSpec.describe "Hotel", :type => :model do
  it "should exist" do
    expect(defined?(Hotel)).to be_truthy
  end

  describe "Columns and data types" do
     {
      "name" => :string,
      "address" => :string
     }.each do |column_name, type|
      it "should have a #{column_name} column" do
        expect(Hotel.column_names).to include column_name
      end

      it "#{column_name} column should store a #{type}" do
        expect(Hotel.columns.find { |column| column.name == column_name }.type).to eq type
      end
    end
  end

  describe "Associations" do
    it "should have many rooms" do
      expect(Hotel.reflect_on_association(:rooms).macro).to eq(:has_many)
    end

    it "should have a dependent destroy on rooms" do
      hotel = Hotel.create(name: "Le Wagon Hotel", address: "16 villa Gaudelet, 75011 Paris")
      Room.create(price_per_night: 90, capacity: 2, hotel: hotel)
      expect { hotel.destroy }.to change { Room.count }.by(-1)
    end
  end

  describe "Validations" do
    %i[name address].each do |column_name|
      it "can't be saved without a #{column_name}" do
        hotel = Hotel.new
        hotel.valid?
        expect(hotel.errors.messages[column_name]).to include "can't be blank"
      end
    end
  end
end
