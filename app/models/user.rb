# User model class
class User < ApplicationRecord
  has_many :posts, foreign_key: 'user_id', class_name: 'Post'
  has_many :comments, foreign_key: 'user_id', class_name: 'Comment'
  has_many :likes, foreign_key: 'user_id', class_name: 'Like'

  after_save :recent_posts

  # validations
  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than: -1 }

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
