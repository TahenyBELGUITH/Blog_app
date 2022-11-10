class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_save :update_likes_counter

  def update_likes_counter
    likes.post.increment!(:likes_counter)
  end
end
