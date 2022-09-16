class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comments_params)
    redirect_to user_posts_path(id: @comment.post_id, user_id: @comment.user_id) if @comment.save
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize! :destroy, @comment

    @post = Post.find(@comment.post_id)

    flash[:success] = ['Comment Deleted Successfully']
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to "/users/#{current_user.id}/posts/#{@post.id}" }
      format.json { head :no_content }
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:text, :post_id, :user_id)
  end
end
