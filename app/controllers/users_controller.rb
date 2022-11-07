class UsersController < ApplicationController
 
 before_action :set_user, only: %i[show]
 
 def index 
  @users = User.paginate(page: params[:page], per_page: 3)
 end

 def show 
 end

 private 
 def set_user
  @user = User.find(params[:id])
 end
 
end
