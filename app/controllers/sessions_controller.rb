class SessionsController < ApplicationController
  # def new
  # end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to posts_path
      flash[:notice] = "Successful login, welcome #{@user.name}"
    else
      redirect_to root_path
      flash[:error] = "Incorrect email or password"
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
