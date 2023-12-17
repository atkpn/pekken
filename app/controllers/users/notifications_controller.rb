class Users::NotificationsController < ApplicationController
  before_action :authorize_notification_access, only: [:edit, :update]

  def new
    @notification = Notification.new
  end

  def create
    @notification = Notification.new(notification_params)
    @notification.user_id = current_user.id
    @notification.user_uid = current_user.uid
    # LINE連携されていて、かつ、登録する日付が現在時刻より後の場合は、保存できるようにする
    if @notification.user_uid.present?
      if @notification.save
        redirect_to notifications_path
      else
        render :new
      end
    end
  end

  def index
    @notifications = Notification.all
    @notifications = current_user.notifications.order(:due_date)
  end

  def edit
    @notification = Notification.find(params[:id])
  end

  def update
    @notification = Notification.find(params[:id])
    if @notification.update(notification_params)
      redirect_to notifications_path
    else
      render :edit
    end
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

  def authorize_notification_access
    notification = Notification.find(params[:id])
    unless current_user == notification.user
      redirect_to notifications_path, alert: '権限がありません。'
    end
  end

end
