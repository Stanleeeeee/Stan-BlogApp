class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @user_posts = Post.where(user_id: params[:user_id]).order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end
end
