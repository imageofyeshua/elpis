class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost = current_user.microposts.build
      @paginator = Paginator.new(
        current_user.microposts.order(created_at: :desc),
        page: params[:page],
        per_page: 10
      )
      @feed_items = @paginator.records
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
