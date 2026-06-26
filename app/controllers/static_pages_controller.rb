class StaticPagesController < ApplicationController
  def home
  end

  def shortly
    @user = User.new
  end

  def loopstudios
  end
end
