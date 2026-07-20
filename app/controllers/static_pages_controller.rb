class StaticPagesController < ApplicationController
  def home
    @micropost = current_user.microposts.build if logged_in?
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
