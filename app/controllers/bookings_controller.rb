class BookingsController < ApplicationController
  before_action :set_island, only: %i[create new edit update accept decline]

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = current_user.bookings.build(booking_params)
    @booking.island = @island
    if @booking.save
      redirect_to island_path(@island), notice: 'Booking requested.'
    else
      @last_user_booking = current_user.last_booking_on_island(@island)
      @review = Review.new
      render "islands/show", status: :unprocessable_entity
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to user_path(current_user)
  end

  def decline
    @booking = Booking.find(params[:id])
    @booking.decline!
    redirect_to @booking.island, notice: 'Booking declined.'
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.status = "Accepted"
    redirect_to @booking.island, notice: "Booking accepted!" if @booking.save
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_island
    @island = Island.find(params[:island_id])
  end
end
