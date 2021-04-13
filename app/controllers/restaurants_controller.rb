class RestaurantsController < ApplicationController

before_action :find_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def show; end
    # @restaurant = Restaurant.find(params[:id])

  def new
    @restaurant = Restaurant.new
  end

  def create
    # @restaurant = Restaurant.new(params[:restaurant]) # != security
    @restaurant = Restaurant.new(restaurant_params)     # = security
    @restaurant.save
    redirect_to restaurant_path(@restaurant)    # to show_path(+id)=>routers
    # redirect to product page by using dynamic path (from router/incl. id)
  end

  def edit; end
    # @restaurant = Restaurant.find(params[:id])

  def update
    # @restaurant = Restaurant.find(params[:id])  # update selected only
    @restaurant.update(restaurant_params)       # update allowed field only
    redirect_to restaurant_path(@restaurant)    # to show_path(+id)
  end

  def destroy
    # @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path                # to index_path
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :rating)
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
