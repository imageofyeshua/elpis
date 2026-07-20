class StaticPagesController < ApplicationController
  include Paginatable

  def home
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed
      @pagination, @feed_items = paginate(current_user.feed.order(created_at: :desc), per_page: 10)
    end
  end

  def help
  end

  def about
  end

  def contact
  end

  def shortly
    @user = User.new
  end

  def loopstudios
  end
end
