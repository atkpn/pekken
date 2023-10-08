class Users::NotificationsController < ApplicationController
  def new
    @notification = Notification.new
  end

  def create
    notification = Notification.new(notification_params)
    notification.user_id = current_user.id
    notification.user_uid = current_user.uid
    notification.save
    redirect_to notifications_path
  end

  def index
    @notifications = Notification.all
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def notification_params
    params.require(:notification).permit(:user_id, :user_uid, :task, :due_date)
  end

end
