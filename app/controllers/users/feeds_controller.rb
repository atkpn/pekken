class Users::FeedsController < ApplicationController

  def new
    @feed = Feed.new
  end

  def create
    feed = Feed.new(feed_params)
    feed.save
    redirect_to pet_feeds_path
  end
  
  def index
    @feeds = Feed.all
  end

  private

  def feed_params
    params.require(:feed).permit(:feed_name, :maker, :classification, :amount, :calorie)
  end

end
