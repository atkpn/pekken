class Users::PetCaresController < ApplicationController
  before_action :set_pet
  before_action :set_care

  def new
    @pet_care = PetCare.new
  end

  def create
    pet_care = PetCare.new(pet_care_params)
    pet_care.save
    redirect_to pet_care_pet_cares_path(pet_id: @pet.id, care_id: @care.id)
  end

  def index
    @pet_care = PetCare.where(pet_id: @pet.id, care_id: @care.id).order(date_time: :desc)
  end

  def edit
    @pet_care = PetCare.find(params[:id])
  end

  def update
    pet_care = PetCare.find(params[:id])
    pet_care.update(pet_care_params)
    redirect_to pet_care_pet_cares_path(pet_id: @pet.id, care_id: @care.id)
  end

  def destroy
    pet_care = PetCare.find(params[:id])
    pet_care.destroy
    redirect_to request.referer #削除後もリダイレクト先は記録一覧ページのまま
  end

  private

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end

  def set_care
    @care = Care.find(params[:care_id])
  end

  def pet_care_params
    params.require(:pet_care).permit(:care_id, :pet_id, :value, :memo, :date_time)
  end

end
