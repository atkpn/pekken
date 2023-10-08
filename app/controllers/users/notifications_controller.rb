class Users::NotificationsController < ApplicationController
  def new
    @notification = Notification.new
  end

  def create
    notification = Notification.new(notification_params)
    notification.user_id = current_user.id
    notification.user_uid = current_user.uid
    if notification.user_uid.present?
      notification.save
      redirect_to notifications_path
    else
      # LINE連携画面にリダイレクトしたい
    end
  end

  def index
    @notifications = Notification.all
    @notifications = current_user.notifications
  end

  def edit
    @notification = Notification.find(params[:id])
  end

  def update
    notification = Notification.find(params[:id])
    notification.update(notification_params)
    redirect_to notifications_path
  end

  def destroy
    notification = Notification.find(params[:id])
    notification.destroy
    redirect_to request.referer
  end

  private

  def notification_params
    params.require(:notification).permit(:user_id, :user_uid, :task, :due_date)
  end

end
