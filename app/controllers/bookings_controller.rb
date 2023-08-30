class BookingsController < ApplicationController
  def index
    @bookings_as_renter = Booking.where(user: current_user).order(date: :desc)
    my_ovens = Oven.where(user: current_user)
    @bookings_as_owner = Booking.where(oven: my_ovens).order(date: :desc)
  end

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
    params.require(:booking).permit(:status, :date, :time, :user_id, :oven_id)
  end
end
