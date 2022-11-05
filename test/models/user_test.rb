require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup 
    @user = User.new(name: "Alan", posts_counter: 0)
  end

  test "user should be valid" do
    assert @user.valid?
  end

  test "user name should be present" do
    @user.name = ""
    assert_not @user.valid? 
  end

  test "posts counter should be greater or equal to 0 " do
    @user.posts_counter > 0
    assert @user.valid? 
  end

end
