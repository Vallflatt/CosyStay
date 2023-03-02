class FlatsController < ApplicationController
  before_action :set_flat, only: %i[show]
  skip_before_action :authenticate_user!, only: :index
  def index
    #   if params.has_key?(:lat) && params.has_key?(:lng) && params.has_key?(:dist)
    #     latitude = params["lat"].to_f
    #     longitude = params["lng"].to_f
    #     dist = params["dist"].to_f

    #     @flats = Flat.where([
    #       "latitude <= ? and latitude >= ? and longitude <= ? and longitude >= ?",
    #       latitude + dist,
    #       latitude - dist,
    #       longitude + dist,
    #       longitude - dist
    #     ])
    #   else
    #     @flats = Flat.limit(10)
    #   end
    # end
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
  end

  # def new
  #   @flat = Flat.new
  # end

  # def create
  #   @flat = Flat.new(flat_params)
  #   if @flat.save
  #     redirect_to flat_path(@flat)
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  # def destroy
  #   @flat.destroy
  #   redirect_to flat_path, status: :see_other
  # end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  # def flat_params
  #   params.require(:flat).permit(:title, :description, :street, :city, :country, :image_url, :price)
  # end
end
