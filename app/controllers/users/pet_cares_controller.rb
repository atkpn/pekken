class Users::PetCaresController < ApplicationController
  before_action :set_pet
  before_action :set_care

  def new
    @pet_care = PetCare.new
  end

  def edit
  end

  def show
  end

  private

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end

  def set_care
    @care = Care.find_by(pet_id: params[:pet_id], care_item_id: params[:id])
  end

  def pet_care_params
    params.require(:pet_care).permit(:care_id, :pet_id, :value, :memo, :date_time)
  end

end
