# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: { minimum: 3, maximum: 250 }
  validates :comments_counter, :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }


  def five_recent_comments
    post.comments.last(5)
  end

  def update_posts_counter
    post.user.increment!(:posts_counter)
  end
  
  
end
