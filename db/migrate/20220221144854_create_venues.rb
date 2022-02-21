class CreateVenues < ActiveRecord::Migration[6.1]
  def change
    create_table :venues do |t|
      t.integer :price
      t.integer :square_meter
      t.integer :capacity
      t.string :location
      t.string :status

      t.timestamps
    end
  end
end
