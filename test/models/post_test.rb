# frozen_string_literal: true

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup 
    @post = Post.new(title: "Ruby on rails", likes_counter: 0, comments_counter: 0)
  end

  test "post should be valid" do
    assert_not @post.valid?
  end

  test "post title should be present" do
    @post.title = ""
    assert_not @post.valid? 
  end

  test "likes counter should be greater or equal to 0 " do
    @post.likes_counter = 0
    assert @post = 0
  end

  test "comments counter should be greater or equal to 0 " do
    @post.comments_counter = 0
    assert @post = 0
  end

  test "title should not be too long" do 
    @post.title = "a" * 251
    assert_not @post.valid?
  end

  test "title should not be too short" do 
    @post.title = "aa"
    assert_not @post.valid?
  end

end
