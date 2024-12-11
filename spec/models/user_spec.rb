require 'rails_helper'

RSpec.describe "User", :type => :model do
  describe "Associations" do
    it "should have many bookings" do
      expect(User.reflect_on_association("bookings").macro).to eq(:has_many)
    end
  end
end
