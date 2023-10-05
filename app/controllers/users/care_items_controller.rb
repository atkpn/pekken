class Users::CareItemsController < ApplicationController

  def create
    care_item = CareItem.new(care_item_params)
    care_item.user_id = current_user.id
    care_item.save
    redirect_to request.referer #更新後もリダイレクト先のページは特定のペットの項目追加画面のまま
  end

  def edit
    session[:previous_url] = request.referer #前のページ（特定のペットの項目追加画面）のURLを保存
    @care_item = CareItem.find(params[:id])
  end

  def update
    care_item = CareItem.find(params[:id])
    care_item.update(care_item_params)
    redirect_to session[:previous_url] #更新後、特定のペットの項目追加画面にリダイレクト
  end

  def destroy
    care_item = CareItem.find(params[:id])
    care_item.destroy
    redirect_to request.referer #削除後もリダイレクト先のページは特定のペットの項目追加画面のまま
  end

  private

  def care_item_params
    params.require(:care_item).permit(:name, :unit, :default_item, :user_id)
  end
end
