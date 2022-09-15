class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  # validations
  validates :user_id, presence: true
  validates :post_id, presence: true

  after_save :update_posts_likes_counter

  private

  def update_posts_likes_counter
    post.increment!(:likes_counter)
  end
end
