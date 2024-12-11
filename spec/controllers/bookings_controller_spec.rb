require 'rails_helper'

RSpec.describe "BookingsController", type: :controller do
  render_views

  let(:room) { create :room }
  let(:user) { create :user }
  before(:each) do
    self.controller = BookingsController.new
    sign_in user
  end

  context "POST create" do
    it "responds with 200 HTTP code" do
      starts_at = Time.zone.now
      post :create, params: { room_id: room.id, booking: { starts_at: starts_at, ends_at: starts_at + 2.day } }
      expect(response).to have_http_status(302)
    end

    it "creates a new booking" do
      starts_at = Time.zone.now
      bookings_count = Booking.count
      post :create, params: { room_id: room.id, booking: { starts_at: starts_at, ends_at: starts_at + 2.day } }
      expect(Booking.count).to eq(bookings_count + 1)
    end
  end
end
