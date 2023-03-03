class Flat < ApplicationRecord
  geocoded_by :address

  has_many :bookings, dependent: :destroy
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates :city, presence: true
  validates :street, presence: true
  validates :country, presence: true
  validates :image_url, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  after_validation :geocode, if: :will_save_change_to_street?

  def address
    "#{street}, #{city}"
  end
end
