class AddRowToVenues < ActiveRecord::Migration[6.1]
  def change
    add_column :venues, :name, :string
  end
end
