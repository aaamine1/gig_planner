class BookingsController < ApplicationController
  def new
    @bookings = Booking.new
    @venue = Venue.find(params[:venue_id])
  end

  def create
    @bookings = Booking.new(booking_params)
    @venue= Venue.find(params[:venue_id])
    @booking.venue = @venue
    # raise
    if @booking.save
      # redirect_to venue_booking_path(@venue, @booking)
      redirect_to venue_path(@venue)
    else
      render :new
    end
  end

  def accept
  end

  def reject
  end


  private

  def booking_params
    params.require(:booking).permit(:status, :start_date, :end_date, :venue_id)
  end
end
