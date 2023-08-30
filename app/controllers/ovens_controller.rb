class OvensController < ApplicationController
  before_action :set_oven, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: :index

  def index
    @ovens = Oven.all
    if params[:query].present?
      sql_subquery = "title ILIKE :query OR description ILIKE :query OR address ILIKE :query"
      @ovens = @ovens.where(sql_subquery, query: "%#{params[:query]}%")
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

  private

  def set_oven
    @oven = Oven.find(params[:id])
  end

  def oven_params
    params.require(:oven).permit(:title, :brand, :address, :description, :price, photos: [])
  end
end
