class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[ home venue ]

  def home
  end

  def dashboard
    # @my_bookings = current_user.bookings
    @my_bookings = Booking.all.select do |booking|
      booking.user_id == current_user.id
    end
    # (my venues)
    # @my_venues = current_user.venues
    @my_venues = Venue.all.select do |venue|
      venue.user_id == current_user.id
    end
    # bookings others made for a venue of mine
    @my_pending_requests = []
    current_user.venues.each do |venue|
      venue.bookings.each do |booking|
        @my_pending_requests << booking
      end
    end
    # raise
  end
# current_user.bookings # (my bookings of other venues)
# current_user.venues # (my venues)
# current_user.venues.each do |venue|
#   venue.bookings # bookings others made for a venue of mine
#   # link_to 'accept this booking', accept_booking_path, method: :patch, status: "accepted"
#   # link_to 'reject this booking', reject_booking_path, method: :patch, status: "rejected"
end
