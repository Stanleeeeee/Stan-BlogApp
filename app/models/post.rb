# post model class
class Post < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :comments, dependent: :destroy, class_name: 'Comment'
  has_many :likes, dependent: :destroy, class_name: 'Like'

  # validations methods
  validates :title, presence: true, length: { in: 5..250 }
  validates :comments_counter, :likes_counter,
            numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  after_save :updates_post_counter

  def updates_post_counter
    user.increment!(:posts_counter)
  end

  def recent_comments
    comments.limit(5).order(created_at: :desc)
  end
end
