class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @hotels = Hotel.all
  end

  def dashboard
    @bookings = current_user.bookings.order(starts_at: :desc)
  end
end
