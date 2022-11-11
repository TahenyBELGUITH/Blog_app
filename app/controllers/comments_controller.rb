class CommentsController < ApplicationController
  load_and_authorize_resource
  before_action :set_user, only: [:create]
  before_action :set_post, only: [:create]

  def create
    @comment = Comment.new(comment_params)
    @comment.post = @post
    @comment.user = current_user
    if @comment.save
      redirect_to user_post_path(@user, @post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @comment = Comment.new
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = Post.find(@comment.post_id)
    @post.comments_counter -= 1
    @comment.destroy
    @post.save
    flash[:notice] = 'Comment was successfully deleted'
    redirect_to user_post_path(current_user, @post)
  end

  def post_create_api
    @post = Post.find(params[:id])
    @comment = current_user.comments.create!(comment_params)
    if @comment.save
      render json: @comment, only: %i[id user_id post_id text], status: :ok
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
