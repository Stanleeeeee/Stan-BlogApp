class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  # validations
  validates :user_id, presence: true
  validates :post_id, presence: true
  validates :text, presence: true

  def comments_post_counter
    post.update(comments_counter: post.comments.count)
  end

  def default_values
    self.posts_counter ||= 0
  end
end
