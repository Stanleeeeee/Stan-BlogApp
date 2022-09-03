class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def comments_posts_counter
    post.update(comments_counter: post.comments.count)
  end
end
