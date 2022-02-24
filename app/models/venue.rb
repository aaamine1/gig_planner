class Venue < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  validates :name, :square_meter, :capacity, :price, :location, presence: true
  validates :square_meter, :capacity, :price, numericality: { only_integer: true }
  has_one_attached :photo
end
