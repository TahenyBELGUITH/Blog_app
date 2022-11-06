# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_save :update_comments_counter

def update_comments_counter
  comment.post.increment!(:comments_counter)
end
  
end
