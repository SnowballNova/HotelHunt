class BookingsController < ApplicationController
  def new
    @room = Room.find(params[:room_id])
    @booking = Booking.new
  end

  def create
    @room = Room.find(params[:room_id])
    @booking = @room.bookings.build(booking_params)
    @booking.user = current_user

    if @booking.save
      redirect_to @room, notice: 'Booking was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:starts_at, :ends_at)
  end
end
