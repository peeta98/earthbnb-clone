class BookingsController < ApplicationController
  before_action :set_island, only: %i[create new edit update accept decline]

  def new
    @booking = Booking.new
  end

  def create
    @booking = current_user.bookings.build(booking_params)
    @booking.island = @island
    if @booking.save
      redirect_to @island, notice: 'Booking requested.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_island
    @island = Island.find(params[:island_id])
  end
end
