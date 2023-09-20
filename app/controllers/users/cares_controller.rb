class Users::CaresController < ApplicationController
  def new
    @care = Care.new
  end

  def create
    care = Care.new(care_params)
    care.save
    redirect_to my_page_path
  end

  def edit
  end

  def show
  end

  private

  def care_params
    params.require(:care).permit(:name)
  end

end
