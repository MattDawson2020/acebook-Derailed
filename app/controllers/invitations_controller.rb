class InvitationsController < ApplicationController
  def create
   
    @current_user = User.find_by(id: session[:user_id]) 
    @friend_id = params[:format]
    @current_user.send_invite(@friend_id)
    redirect_to posts_url
  end

end
