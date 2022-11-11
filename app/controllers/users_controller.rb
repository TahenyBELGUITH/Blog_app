class UsersController < ApplicationController
  def index
    @users = User.all
    @user = current_user

    # render json: @users
  end

  def show
    set_user
  end

  def api_user_post
    @posts = User.find(params[:id]).posts
    respond_to do |format|
      format.json { render json: @posts }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
