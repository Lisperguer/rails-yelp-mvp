class ReviewsController < ApplicationController
  
  #para crear un nuevo review(formulario)
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(params[:id])
  end
  
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant 
    #@review.restaurant_id = @restaurant.id
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
