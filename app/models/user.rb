# User model class
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist
  has_many :posts, foreign_key: 'user_id', class_name: 'Post'
  has_many :comments, foreign_key: 'user_id', class_name: 'Comment'
  has_many :likes, foreign_key: 'user_id', class_name: 'Like'

  ROLES = %I[admin defaut].freeze
  after_save :recent_posts

  # validations
  validates :name, presence: true
  validates :email, uniqueness: true
  validates :posts_counter, numericality: { only_integer: true, greater_than: -1 }

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  def is?(requested_role)
    ROLES == requested_role.to_s
  end
end
