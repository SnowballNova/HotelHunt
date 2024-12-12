class RoomsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_room, only: :show

  def index
    @rooms = Room.all
    respond_to do |format|
      format.html # This will render the default index.html.erb
      format.json { render json: @rooms }
    end
  end

  def show
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end
end
