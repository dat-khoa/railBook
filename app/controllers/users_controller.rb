class UsersController < ApplicationController
before_action :correct_user, only: [:show, :edit, :update]

def index
  @users = User.all 
end

def show
  @user = User.find(params[:id])
end

def new
  @user = User.new
end

def create
  @user = User.new(user_params)
  if @user.save
    log_in @user
    remember @user
    flash[:success] = "Welcome to the Sample App!"
    redirect_to @user
  else
    render 'new'
  end
end

def edit; end

def update
  @user = User.find(params[:id])
  if @user.update_attributes(user_params)
    flash[:success] = "Profile updated"
    redirect_to @user
  else
    render 'edit'
  end
end

private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
end
