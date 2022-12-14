class User < ApplicationRecord
  validates :email, uniqueness: { allow_blank: true }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :comments
  has_many :posts
  has_many :likes

  validates :name, presence: true
  # validates :posts_counter, numericality: { greater_than_or_equal_to: 0 }

  def three_recent_posts
    user.posts.last(3)
  end
end
