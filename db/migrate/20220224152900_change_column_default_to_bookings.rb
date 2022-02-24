class ChangeColumnDefaultToBookings < ActiveRecord::Migration[6.1]
  def change
    change_column_default :bookings, :status, "pending"
  end
end
