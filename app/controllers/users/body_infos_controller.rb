class Users::BodyInfosController < ApplicationController
  before_action :set_pet

  def new
    @body_info = BodyInfo.new
    @body_info_all = BodyInfo.all
  end

  def create
    body_info = BodyInfo.new(body_info_params)
    body_info.pet = @pet
    if body_info.save
      redirect_to new_pet_body_info, notice: "体重と全長が記録されました。"
    else
      render :new
    end
  end

  private

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end

  def body_info_params
    params.require(:body_info).permit(:length, :weight, :memo)
  end

end
