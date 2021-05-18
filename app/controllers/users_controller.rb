class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      redirect_to posts_url
      flash[:notice] = "Hello #{@user.name}"
      
    end
    redirect_to '/signup'
    flash[:emailerror] = 'email already in use'
  end

  # def index
  #   @posts = Post.all
  # end

  private

  def user_params
    params.require(:user).permit(:name, :password, :email)
  end
end