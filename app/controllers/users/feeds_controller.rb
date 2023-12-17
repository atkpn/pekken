class Users::FeedsController < ApplicationController
  before_action :authorize_feed_access, only: [:edit, :update]

  def new
    @feed = Feed.new
  end

  def create
    @feed = Feed.new(feed_params)
    @feed.user_id = current_user.id
    if @feed.save
      redirect_to feeds_path
    else
      render :new
    end
  end

  def index
    @feeds = Feed.where(user_id: current_user.id)
  end

  def edit
    @feed = Feed.find(params[:id])
  end

  def update
    feed = Feed.find(params[:id])
    feed.update(feed_params)
    redirect_to feeds_path
  end

  def destroy
    feed = Feed.find(params[:id])
    feed.destroy
    redirect_to feeds_path
  end

  private

  def feed_params
    params.require(:feed).permit(:feed_name, :maker, :classification, :amount, :calorie)
  end

  def authorize_feed_access
    feed = Feed.find(params[:id])
    unless current_user == feed.user
      redirect_to feeds_path, alert: '権限がありません。'
    end
  end

end
