class Users::MealsController < ApplicationController
  before_action :set_pet

  def new
    @meal = Meal.new
    @feeds = Feed.all
  end

  def create
    meal = Meal.new(meal_params)
    meal.pet = @pet
    meal.save
    redirect_to pet_meals_path
  end

  def index
    @meals = Meal.joins(:feed).where(pet: @pet).select("date(meals.datetime) as datetime, sum((meals.amount_eaten * feeds.calorie)/feeds.amount) as calorie").group("date(meals.datetime)").order(datetime: :desc)
  end

  def show
    @date = DateTime.parse(params[:id])
    @meals = Meal.where(pet: @pet).where(datetime: @date.beginning_of_day...@date.end_of_day).order(:datetime)
  end

  def edit
    @meal = Meal.find(params[:id])
    @feeds = Feed.all
  end

  def update
    meal = Meal.find(params[:id])
    meal.update(meal_params)
    redirect_to pet_meal_path(@pet, meal.datetime)
  end

  def destroy
    meal = Meal.find(params[:id])
    meal.destroy
    redirect_to pet_meal_path(@pet, meal.datetime)
  end

  private

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end

  def meal_params
    params.require(:meal).permit(:amount_eaten, :feed_id, :datetime)
  end

end
