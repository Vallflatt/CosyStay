class FlatsController < ApplicationController
  before_action :set_flat, only: %i[show]
  skip_before_action :authenticate_user!, only: :index
  def index
    if params.has_key?(:lat) && params.has_key?(:lng) && params.has_key?(:dist)
      latitude = params["lat"].to_f
      longitude = params["lng"].to_f
      dist = params["dist"].to_f

      @flats = Flat.all
      # The `geocoded` scope filters only flats with coordinates
      @markers = @flats.geocoded.map do |flat|
        {
          lat: flat.latitude,
          lng: flat.longitude
        }
      end
    else
      @flats = Flat.limit(10)
    end
  end

  def show
    @flat = Flat.find(params[:id])
    @booking = Booking.new
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end
end
