class ReviewsController < ApplicationController
  before_action :set_booking, only: %i[new create]

  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
  end


  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    @review.booking = @booking
    if @review.save!
      redirect_to bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to booking_path(@review.booking), status: :see_other
  end
end
