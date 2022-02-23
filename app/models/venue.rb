class Venue < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :name, :square_meter, :capacity, :price, :location, presence: true 
  validates :square_meter, :capacity, :price, numericality: { only_integer: true }
end
