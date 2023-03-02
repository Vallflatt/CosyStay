class FlatsController < ApplicationController

  before_action :set_flat, only: %i[show]

  # def index
  #   @flats = Flat.all
  # end

  def show
    @flat = Flat.find(params[:id])
    @booking = Booking.new
  end

  # def datepicker_input form, field
  #   content_tag :td, :data => {:provide => 'datepicker', 'date-format' => 'yyyy-mm-dd', 'date-autoclose' => 'true'} do
  #     form.text_field field, class: 'form-control', placeholder: 'YYYY-MM-DD'
  #   end
  # end

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
