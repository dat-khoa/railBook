class UsersController < ApplicationController
  before_action :correct_user, only: [:show, :edit, :update]
  before_action :logged_in_user, only: [:edit, :update]

  def index
    @users = User.paginate(:page =>params[:page], :per_page => 5)
    @user1 = User.first
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user
      log_in @user
      remember @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def save
  end
 
  def destroy

    @user = User.find(params[:id])
    flash[:sucess] = "Profile deleted"
    if @user.is_admin?
      redirect_to root_url
      @user.delete
    else
      @user.delete
      redirect_to login_url
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                  :password_confirmation)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

  end