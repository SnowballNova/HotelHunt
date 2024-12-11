class HotelsController < ApplicationController
  def index
    @hotels = Hotel.all
  end

  def show
    @hotel = Hotel.find(params[:id])
  end

  def new
    @hotel = Hotel.new
  end

  def create
    @hotel = Hotel.new(hotel_params)
    if @hotel.save
      redirect_to hotel_path(@hotel), notice: 'Hotel was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def hotel_params
    params.require(:hotel).permit(:name, :address)
  end
end
