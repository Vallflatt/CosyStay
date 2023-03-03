class BookingsController < ApplicationController
  before_action :set_flat, only: %i[create]
  def index
    bookings = current_user.requested_bookings
    @pending_bookings = bookings.where(confirmed: false)
    @approved_bookings = bookings.where(confirmed: true)
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.flat = @flat
    # @booking.user = current_user

    if @booking.save
      redirect_to booking_path(@booking), notice: 'Booking was successfully created.'
    else
      render "flats/show", status: :unprocessable_entity
    end
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.update(confirmed: true)
    redirect_to bookings_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def set_flat
    @flat = Flat.find(params[:flat_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
