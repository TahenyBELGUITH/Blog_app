class PostsController < ApplicationController
  before_action :set_post, only: %i[show destroy edit update]

 def index
   @user = User.find(params[:user_id])
   @posts = @user.posts
 end

 def show 
   @user = User.find(params[:user_id])
 end

 def new 
  @post = Post.new 
 end

 def create 
  @post = Post.new(post_params)
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
    redirect_to user_posts_path
  else
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
