class Users::PetsController < ApplicationController
  before_action :authorize_pet_access, only: [:show, :edit, :update, :destroy]

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user_id = current_user.id
    if @pet.save
      redirect_to pet_path(@pet.id)
    else
      render :new
    end
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])
    if @pet.update(pet_params)
      redirect_to pet_path(@pet.id)
    else
      render :edit
    end
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

  def authorize_pet_access
    pet = Pet.find(params[:id])
    unless current_user == pet.user
      redirect_to my_page_path, alert: '権限がありません。'
    end
  end

end
