require "rails_helper"

describe "Room", type: :system do
  let(:room) { create :room }
  let(:user) { create :user }
  before(:each) { login_as user }

  context "On rooms#show" do
    it "can fill the booking form with Flatpicker" do
      visit room_path(room)
      if Nokogiri::HTML(page.body).search('.flatpickr-calendar.rangeMode').any?
        # For Flatpicker with range mode
        find('div.booking_starts_at input').click
        find('.flatpickr-day.today').click
        find('.flatpickr-day.today + .flatpickr-day').click
      else
        # For Flatpicker without range mode
        find('div.booking_starts_at input.input').click
        find('.flatpickr-day.today').click
        find('div.booking_ends_at input.input').click
        find('.flatpickr-day.today + .flatpickr-day').click
      end
      find('form#new_booking input[name="commit"]').click
      visit room_path(room)
      expect(room.reload.bookings.count).to eq(1)
    end
  end
end
