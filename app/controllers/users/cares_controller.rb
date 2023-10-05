class Users::CaresController < ApplicationController
  before_action :set_pet

  def new
    # binding.pry
    @care = Care.new
    @default_items = CareItem.where(default_item: true)
    @custom_items = CareItem.where(default_item: false)

    @care_item = CareItem.new
  end

  def create
    care_item_ids = params[:care][:care_item_id].reject(&:blank?)
    care_item_ids.each do |care_item_id|
      care_item = CareItem.find(care_item_id)
      #@pet.care_items << care_item

      next if Care.find_by(pet_id: @pet.id, care_item_id: care_item_id)
      care = Care.new(pet: @pet, care_item: care_item)
      care.save
    end
    redirect_to pet_cares_path
  end

  def index
    @care_items = @pet.care_items
  end

  def destroy
    care = Care.find_by(pet_id: params[:pet_id], care_item_id: params[:id])
    care.destroy
    redirect_to request.referer #削除後もリダイレクト先のページは特定のペットの項目一覧のまま
  end

  private

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end

  def care_params
    params.require(:care).permit(:care_item_id, :pet_id)
  end

end