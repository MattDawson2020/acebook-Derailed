class InvitationsController < ApplicationController
  def create
    @current_user = User.find_by(id: session[:user_id])
    @friend_id = params[:format]
    @current_user.send_invite(@friend_id)
    redirect_to posts_url
  end

  def update
    @current_user = User.find_by(id: session[:user_id])
    @invitation = Invitation.find_by(id: params[:id])
    @response = params[:format]
    @response == "true" ? accept(@invitation) : refuse
    redirect_to posts_url
  end

  private

  def accept(invite)
    invite.update(confirmed: true)
  end

  def refuse
    @invitation.destroy
  end
end
