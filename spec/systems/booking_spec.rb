require "rails_helper"

describe "Booking", type: :system do
  let(:room) { create :room }
  let(:user) { create :user }
  before(:each) { login_as user }

  context "On rooms#show" do
    it "displays a flash notice after creating a booking" do
      visit room_path(room)
      if Nokogiri::HTML(page.body).search('.flatpickr-calendar.rangeMode').any?
        # For Flatpickr with range mode
        find('div.booking_starts_at input').click
        find('.flatpickr-day.today').click
        find('.flatpickr-day.today + .flatpickr-day').click
      elsif Nokogiri::HTML(page.body).search('.flatpickr-calendar').any?
        # For Flatpickr without range mode
        find('div.booking_starts_at input').click
        find('.flatpickr-day.today').click
        find('div.booking_ends_at input').click
        find('.flatpickr-day.today + .flatpickr-day').click
      elsif Nokogiri::HTML(page.body).search('div.booking_starts_at input').first&.attributes&.[]("type")&.value == "text"
        # For date inputs as string
        find('div.booking_starts_at input').set "2025-01-01T00:00:00+00:00"
        find('div.booking_ends_at input').set "2025-01-02T00:00:00+00:00"
      else
        current_year_for_ends_at = find('#booking_ends_at_1i').value.to_i
        find('#booking_ends_at_1i').set current_year_for_ends_at + 1
      end
      find('form#new_booking input[type="submit"]').click
      expect(page).to have_css('.alert')
    end
  end
end
