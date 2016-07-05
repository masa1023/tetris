class RoomsController < ApplicationController
  def index
    @booking = Booking.new
    render :action => 'index'
  end
end
