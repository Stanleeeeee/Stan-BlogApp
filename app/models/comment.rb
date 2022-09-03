class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def comments_post_counter
    post.update(comments_counter: post.comments.count)
  end

  def default_values
    self.posts_counter ||= 0
  end
end
