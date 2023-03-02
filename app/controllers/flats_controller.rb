class FlatsController < ApplicationController
  before_action :set_flat, only: %i[show]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index

    @distance_choices = [10, 20, 50, 100]

    if params.has_key?(:lat) && params.has_key?(:lng) && params.has_key?(:dist)
      latitude = params["lat"].to_f
      longitude = params["lng"].to_f
      @distance = params["dist"].to_f

      @flats = Flat.near([latitude, longitude], @distance)
      # The `geocoded` scope filters only flats with coordinates
      @markers = @flats.map do |flat|
        {
          lat: flat.latitude,
          lng: flat.longitude,
          id: flat.id
        }
      end
      @coordinates = [
        longitude, latitude
      ]
    else
      @distance = 50
      @markers = []
      @flats = Flat.limit(10)
      @coordinates = [6.5761984, 46.5236672]
    end

    @markers = @markers.to_json
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
