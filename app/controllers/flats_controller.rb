class FlatsController < ApplicationController
  before_action :set_flat, only: %i[show]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index

    # [distance in KM, Zoom value]
    @distance_choices = [[15, 12], [20, 10], [50, 8], [100, 6]]

    # Default values
    @distance = 50
    @markers = []
    @coordinates = [6.5761984, 46.5236672]

    if params.has_key?(:lat) && params.has_key?(:lng) && params.has_key?(:dist)
      latitude = params["lat"].to_f
      longitude = params["lng"].to_f
      @distance = params["dist"].to_f

      @flats = Flat.near([latitude, longitude], @distance)
      # The `geocoded` scope filters only flats with coordinates
      @coordinates = [
        longitude, latitude
      ]
    else
      @flats = Flat.limit(10)
    end

    @markers = @flats.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude,
        id: flat.id
      }
    end
    @markers = @markers.to_json
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new, status: :unprocessable_entity
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
