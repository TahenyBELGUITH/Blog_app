class PostsController < ApplicationController
  load_and_authorize_resource
  before_action :set_post, only: %i[destroy edit update]

  def index
    @user = User.find(params[:user_id])
    @posts = Post.all.includes(:comments)
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.includes(comments: [:user]).find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.comments_counter = 0
    @user = User.find(params[:user_id])
    if @post.save
      redirect_to user_posts_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:user_id])
  end

  def update
    if @post.update(post_params)
      flash[:notice] = 'Successfully updated post!'
      redirect_to user_posts_path
    else
      flash[:notice] = 'Error!'
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to user_posts_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
