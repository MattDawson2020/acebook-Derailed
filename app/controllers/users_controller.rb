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
    p params
    @user = User.find(params[:id])
    @user.update(user_params)
    p @user.errors
    redirect_to profile_path
  end

  # def nickname
  # end

  # def add_nickname
  #   permitted = params.permit(:nickname)
  #   p permitted[:nickname]
  #   user = User.find_by(id: session[:user_id])
  #   user.update(nickname: permitted[:nickname])
  #   p user
  #   # user.save
  #   # User.update(session[:user_id], permitted)
  #   # p User.find_by(id: session[:user_id])
  #   redirect_to posts_path
  # end

  private

  def user_params
    params.require(:user).permit(:name, :password, :email, :password_confirmation, :image, :nickname)
  end
end
