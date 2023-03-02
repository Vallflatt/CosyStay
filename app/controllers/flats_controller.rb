class FlatsController < ApplicationController
  before_action :set_flat, only: %i[show]

  def show
    @flat = Flat.find(params[:id])
    @booking = Booking.new
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end
end
