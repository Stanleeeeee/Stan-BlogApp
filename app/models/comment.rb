class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  # validations
  validates :user_id, presence: true
  validates :post_id, presence: true
  validates :text, presence: true

  after_save :comments_post_counter
  after_destroy :decrease_post_comment_counter

  def comments_post_counter
    post.update(comments_counter: post.comments.count)
  end

  def decrease_post_comment_counter
    post.decrement!(:comments_counter) unless post.comments_counter.zero?
  end

  def default_values
    self.posts_counter ||= 0
  end
end
