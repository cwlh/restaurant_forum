class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.order(:id).page(params[:page]).per(9)
  end




end
