class BookingsController < ApplicationController
  def new
    @room = Room.find(params[:room_id])
    @booking = Booking.new
  end

  def create
    @room = Room.find(params[:room_id])
    @booking = Booking.new(booking_params)
    @booking.room = @room
    @booking.user = current_user

    # Split the range into start and end dates if it's a single input
    if params[:booking][:starts_at].present? && params[:booking][:starts_at].include?(" to ")
      start_date, end_date = params[:booking][:starts_at].split(" to ").map(&:strip)
      @booking.starts_at = start_date
      @booking.ends_at = end_date
    end

    if @booking.starts_at.present? && @booking.ends_at.present?
      if @booking.save
        redirect_to room_path(@room), notice: "Booking was successfully created!"
      else
        redirect_to room_path(@room), alert: "Could not create booking. #{@booking.errors.full_messages.join(', ')}"
      end
    else
      redirect_to room_path(@room), alert: "Please select check-in and check-out dates"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:starts_at, :ends_at)
  end
end
