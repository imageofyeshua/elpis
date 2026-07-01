class StaticPagesController < ApplicationController
  def home
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
