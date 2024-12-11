require 'rails_helper'

RSpec.describe "Booking", :type => :model do
  it "should exist" do
    expect(defined?(Booking)).to be_truthy
  end

  describe "Columns and data types" do
     {
      "user_id" => [:integer],
      "room_id" => [:integer],
      "starts_at" => [:datetime, :date],
      "ends_at" => [:datetime, :date]
     }.each do |column_name, types|
      it "should have a #{column_name} column" do
        expect(Booking.column_names).to include column_name
      end

      it "#{column_name} column should store a #{types.join(" or ")}" do
        expect(types).to include(Booking.columns.find { |column| column.name == column_name }.type)
      end
    end
  end

  describe "Associations" do
    %i[room user].each do |association|
      it "should belong to #{association}" do
        expect(Booking.reflect_on_association(association).macro).to eq(:belongs_to)
      end
    end
  end

  describe "Validations" do
    %i[starts_at ends_at].each do |column_name|
      it "can't be saved without a #{column_name}" do
        booking = Booking.new
        booking.valid?
        expect(booking.errors.messages[column_name]).to include "can't be blank"
      end
    end
  end
end
