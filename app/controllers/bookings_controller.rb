class BookingsController < ApplicationController
  before_action :set_flat, only: %i[create]
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

  private

  def set_flat
    @flat = Flat.find(params[:flat_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
