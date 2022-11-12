class Api::PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.paginate(page: params[:page], per_page: 3)
    render json: @posts
  end

  def show
    @post = Post.find(params[:id])
    render json: @post
  end
end
