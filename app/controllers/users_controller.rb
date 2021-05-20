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

  # def index
  #   @posts = Post.all
  # end

  private

  def user_params
    params.require(:user).permit(:name, :password, :email, :password_confirmation)
  end
end
