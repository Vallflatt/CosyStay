class AddDefaultToConfirmation < ActiveRecord::Migration[7.0]
  def change
    change_column :bookings, :confirmed, :boolean, default: false
  end
end
