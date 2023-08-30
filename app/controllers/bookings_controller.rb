class BookingsController < ApplicationController
  before_action :set_booking, only: %i[destroy accept decline]

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
      redirect_to bookings_path
    else
      @bookings = @oven.bookings
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end

  def accept
    @booking.status = "accepted"
    @booking.save
    redirect_to bookings_path
  end

  def decline
    @booking.status = "declined"
    @booking.save
    redirect_to bookings_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:status, :date, :time, :user_id, :oven_id)
  end
end
