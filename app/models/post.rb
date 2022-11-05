# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  def five_recent_comments
    post.comments.last(5)
  end

  def update_posts_counter
    post.user.increment!(:posts_counter)
  end
  
  
end
