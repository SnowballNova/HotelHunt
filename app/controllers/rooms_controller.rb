class RoomsController < ApplicationController
  def index
    if params[:query].present?
      @rooms = Room.joins(:hotel).where("hotels.city ILIKE ?", "%#{params[:query]}%")
    else
      @rooms = Room.all
    end
  end

  def show
    @room = Room.find(params[:id])
  end

  def new
    @hotel = Hotel.find(params[:hotel_id])
    @room = Room.new
  end

  def create
    @hotel = Hotel.find(params[:hotel_id])
    @room = @hotel.rooms.build(room_params)
    if @room.save
      redirect_to hotel_path(@hotel), notice: 'Room was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def room_params
    params.require(:room).permit(:price_per_night, :capacity)
  end
end
