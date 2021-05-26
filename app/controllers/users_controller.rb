class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      redirect_to root_path
      flash[:newuser] = "You have created your account #{@user.name}"
    else
      flash[:emailerror] = "You cannot create an account"

      redirect_to "/signup"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :email, :password_confirmation, :image, :nickname)
  end
end
