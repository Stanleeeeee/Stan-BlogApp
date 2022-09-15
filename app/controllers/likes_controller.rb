class LikesController < ApplicationController
  def create
    @like = Like.new(like_params)
    redirect_to user_posts_path(id: @like.post_id, user_id: @like.user_id) if @like.save
  end

  def like_params
    params.require(:like).permit(:post_id, :user_id)
  end
end
