class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[ home venue ]

  def home
  end

  def dashboard
    @my_bookings = Booking.all.select do |booking|
      booking.user_id == current_user.id
    end
    @my_venues = Venue.all.select do |venue|
      venue.user_id == current_user.id
    end
    # raise

    # requests = []
    @my_pending_requests = current_user.venues.each do |venue|
      venue.bookings
      # booking = venue.bookings
      #
      # requests << booking if !booking.include?(booking)
    end
    # raise

    # @my_pending_requests = @my_venues.select do |venue|
    #     venue.booking_id
    # end
    # raise
  end




  # doctor = Doctor.last

  # patients = []
  # doctor.consultations.each do |consultation|
  # patient = consultation.patient
  # patients << patient if !patients.include?(patient)
  # end
# current_user.bookings # (my bookings of other venues)
# current_user.venues # (my venues)
# current_user.venues.each do |venue|
#   venue.bookings # bookings others made for a venue of mine
#   # link_to 'accept this booking', accept_booking_path, method: :patch, status: "accepted"
#   # link_to 'reject this booking', reject_booking_path, method: :patch, status: "rejected"

end
