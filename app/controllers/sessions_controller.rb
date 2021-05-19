class SessionsController < ApplicationController
  # def new
  # end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)

    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to posts_path
    else
      flash.now[:error] = "Invalid details please try again!"
      render root_path
    end
  end

  def destroy
  end
end
