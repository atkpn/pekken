class Users::BodyInfosController < ApplicationController
  before_action :set_pet

  def new
    @body_info = BodyInfo.new
    @body_info_all = BodyInfo.where(pet_id: @pet.id).order(created_at: :desc)
  end

  def create
    body_info = BodyInfo.new(body_info_params)
    body_info.pet = @pet
    if body_info.save
      redirect_to new_pet_body_info_path(@pet), notice: "体重と全長が記録されました。"
    else
      render :new
    end
  end

  def edit
    @body_info = BodyInfo.find(params[:id])
  end

  def update
    body_info = BodyInfo.find(params[:id])
    body_info.update(body_info_params)
    redirect_to new_pet_body_info_path(@pet)
  end

  def destroy
    body_info = BodyInfo.find(params[:id])
    body_info.destroy
    redirect_to new_pet_body_info_path(@pet)
  end

  private

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end

  def body_info_params
    params.require(:body_info).permit(:length, :weight, :memo)
  end

end
