class BookingsController < ApplicationController
  def new
    @oven = Oven.find(params[:oven_id])
    @booking = Booking.new
  end

  def create
    @oven = Oven.find(params[:oven_id])
    @booking = Booking.new(booking_params)
    @booking.oven = @oven
    @booking.user = current_user
    if @booking.save
      redirect_to oven_path(@booking.oven)
    else
      @bookings = @oven.bookings
      render "ovens/show", status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to oven_path(@booking.oven), status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :date, :user_id, :oven_id)
  end
end
