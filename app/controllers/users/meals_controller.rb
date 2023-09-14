class Users::MealsController < ApplicationController
  before_action :set_pet

  def new
    @meal = Meal.new
  end

  def create
    meal = Meal.new(meal_params)
    meal.pet = @pet
    meal.save
    redirect_to pet_meals_path
  end
  
  def index
    @meals = Meal.all
  end

  private

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end

  def meal_params
    params.require(:meal).permit(:amount_eaten, :feed_id)
  end
  
end
