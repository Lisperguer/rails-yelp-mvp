class RestaurantsController < ApplicationController
  # hacer un each y mostrar todos los restaurants
  def index
    @restaurants = Restaurant.all
  end

  # muestra individualmente las caracteristicas del objeto que estamos creando
  def show
    @restaurant = Restaurant.find(params[:id])
  end
  
  #para crear un nuevo restaurant(formulario)
  def new
    @restaurant = Restaurant.new(params[:id])
  end

  #consta de dos pasos, crear y updatear
  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurant_params)
    redirect_to restaurants_path(@restaurant)

  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.delete
    redirect_to restaurants_path
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
