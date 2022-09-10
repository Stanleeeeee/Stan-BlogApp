class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

def create
  @post = Post.find(params[:post_id])
  @user = User.where(id: @post.user_id)
  @user.each do |user|
    @comment = @post.comments.new(text: comments_params[:text], user_id: user.id, post_id: @post.id)
  end
  redirect_to user_posts_path(id: @post.id, user_id: @post.user_id) if @comment.save
end

private

  def comments_params
    params.require(:comment).permit(:text).tap do |comments_params|
    comments_params.require(:text)
    end
  end
end