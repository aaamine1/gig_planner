class ChangeColumnToVenue < ActiveRecord::Migration[6.1]
  def change
    change_column_default :venues, :image_url, "https://lorempixel.com/730/411"
  end
end
