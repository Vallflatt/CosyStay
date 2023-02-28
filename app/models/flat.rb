class Flat < ApplicationRecord
  has_many :bookings, dependent: :destroy
  validates :title, presence: true
  validates :description, presence: true
  validates :city, presence: true
  validates :street, presence: true
  validates :country, presence: true
  validates :image_url, presence: true
  validates :price, presence: true, :numericality => { :greater_than_or_equal_to => 0 }
end
