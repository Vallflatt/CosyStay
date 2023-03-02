class Booking < ApplicationRecord
  belongs_to :flat

  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :dates_in_future

  before_save :calculate_price

  private

  def calculate_price
    self.total_price = (end_date - start_date) * @flat.price
  end

  def dates_in_future
    errors.add(:end_date, "end date must be after start date") if start_date > end_date

    errors.add(:start_date, "start date can't be in the past") if start_date < Date.today
  end

end
