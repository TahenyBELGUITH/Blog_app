# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_save :update_likes_counter

def update_likes_counter
  like.post.increment!(:likes_counter)
end

end
