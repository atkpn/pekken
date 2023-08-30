class Users::PetsController < ApplicationController
  def new
    @pet = Pet.new
  end

  def create
    pet = Pet.new(pet_params)
    pet.user_id = current_user.id
    pet.save
    redirect_to pet_path(pet.id)
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    pet = Pet.find(params[:id])
    pet.update(pet_params)
    redirect_to pet_path(pet.id)
  end

  def destroy
    pet = Pet.find(params[:id])
    pet.destroy
    redirect_to my_page_path
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :birthday, :came_day, :kind, :sex, :memo, :pet_image)
  end

end
