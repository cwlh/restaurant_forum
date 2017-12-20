class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.order(:id).page(params[:page]).per(9)
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

end
