class OvensController < ApplicationController
  before_action :set_oven, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[show index]

  def index
    if params[:query].present?
      sql_subquery = "title ILIKE :query OR description ILIKE :query OR address ILIKE :query"
      @ovens = Oven.where(sql_subquery, query: "%#{params[:query]}%")
      @markers = @ovens.geocoded.map do |oven|
        {
          lat: oven.latitude,
          lng: oven.longitude,
          info_window_html: render_to_string(partial: "info_window", locals: { oven: oven }),
          marker_html: render_to_string(partial: "marker")
        }
      end
    else
      @ovens = Oven.all
    end
  end

  def show
    @booking = Booking.new
  end

  def new
    @oven = Oven.new
  end

  def create
    @oven = Oven.new(oven_params)
    @oven.user = current_user
    if @oven.save
      redirect_to oven_path(@oven)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @oven.update(oven_params)
    redirect_to oven_path(@oven)
  end

  def destroy
    @oven.destroy
    redirect_to root_path, status: :see_other
  end

  def my_ovens
    @ovens = Oven.where(user: current_user)
  end

  private

  def set_oven
    @oven = Oven.find(params[:id])
  end

  def oven_params
    params.require(:oven).permit(:title, :brand, :address, :description, :price, photos: [])
  end
end
