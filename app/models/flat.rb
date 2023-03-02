class Flat < ApplicationRecord
  def address
    "#{street}, #{city}"
  end

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_street?
  has_many :bookings, dependent: :destroy
  validates :title, presence: true
  validates :description, presence: true
  validates :city, presence: true
  validates :street, presence: true
  validates :country, presence: true
  validates :image_url, presence: true
  validates :price, presence: true, :numericality => { :greater_than_or_equal_to => 0 }

  def show
    @flat = Flat.find(params[:id])
    @booking = Booking.new
  end
end
