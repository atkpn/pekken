class Users::PetsController < ApplicationController
  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user_id = current_user.id
    @pet.save
    redirect_to pet_path(@pet)
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def edit
  end

  def update
  end

  def index
  end

  def destroy
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :birthday, :came_day, :kind, :sex, :memo)
  end

end
