class GiftsController < ApplicationController
  def index
    @gifts = Gift.order(:name)
  end

  def show
    @gift = Gift.find(params[:id])
  end
end
