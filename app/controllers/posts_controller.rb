class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @user_posts = Post.includes(:user, :comments, :likes).where(user_id: params[:user_id]).order(created_at: :desc)

    @comment = Comment.new
    @like = Like.new
  end

  def new
    @post = Post.new
    @params = params
  end

  def create
    @post = Post.new(posts_params)
    if @post.save
      redirect_to user_post_path(id: @post.id, user_id: @post.user_id), notice: 'Post created succesfully!'
    else
      render :new, alert: 'Post could not be created an Error occurred!'
    end
  end

  private

  def posts_params
    params.require(:post).permit(:title, :text, :user_id)
  end
end
