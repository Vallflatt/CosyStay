class BookingsController < ApplicationController
  before_action :set_flat, only: %i[new create]
  def index
    bookings = current_user.requested_bookings
    @pending_bookings = bookings.where(confirmed: false)
    @approved_bookings = bookings.where(confirmed: true)
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.flat = @flat
    @booking.user = current_user

    if @booking.save
      redirect_to flat_bookings_path(@flat), notice: 'Booking is successfully created.'
    else
      render "flats/show", status: :unprocessable_entity
    end
  end

  private

  def set_flat
    @flat = Flat.find(params[:flat_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :flat_id)
  end
end
