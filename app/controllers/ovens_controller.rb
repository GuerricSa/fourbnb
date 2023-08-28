class OvensController < ApplicationController
  before_action :set_oven, only: %i[show]

  def index
    @ovens = Oven.all
  end

  def show
  end

  private

  def set_oven
    @oven = Oven.find(params[:id])
  end
end
