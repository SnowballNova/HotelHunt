class BedroomsController < ApplicationController
  def index
    if params[:query].present?
      @bedrooms = Bedroom.search_by_city(params[:query])
    else
      @bedrooms = Bedroom.all
    end
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
