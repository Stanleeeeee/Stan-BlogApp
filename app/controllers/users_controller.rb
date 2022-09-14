class UsersController < ApplicationController
  def index
    before_action :authenticate_user!
    @users = User.order(:name)
  end

  def show
    @user = User.find(params[:id])
    @recent_posts = @user.recent_posts
  end
end
