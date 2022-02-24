class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @venue = Venue.find(params[:venue_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @venue = Venue.find(params[:venue_id])
    @booking.venue = @venue
    @booking.user = current_user
    # raise
    if @booking.save
      # redirect_to venue_booking_path(@venue, @booking)
      redirect_to venue_path(@venue), notice: "Your booking was successfully created!"
    else
      render :new
    end
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.update(status: 'accepted')
    redirect_to dashboard_path
  end

  def reject
    @booking = Booking.find(params[:id])
    @booking.update(status: 'rejected')
    redirect_to dashboard_path
  end


  private

  def booking_params
    params.require(:booking).permit(:status, :start_date, :end_date, :venue_id)
  end
end
