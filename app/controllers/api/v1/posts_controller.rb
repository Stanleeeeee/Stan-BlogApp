class Api::V1::PostsController < ApplicationController
  # load_and_authorize_resource

  def index
    user = User.find(params[:user_id])
    user_posts = Post.includes(:author, :comments, :likes).where(user_id: params[:user_id]).order(created_at: :desc)
    render json: user
    render json: user_posts
  end

  def show
    post = Post.find(params[:id])
    render json: post
  end
end
