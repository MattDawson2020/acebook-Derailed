class CommentsController < ApplicationController
  
  def new
    @comment = Comment.new
  end

  def create
    @user = User.find(id: session[:user_id])
    p @user
    @comment = Comment.create(user_params)
    redirect_to posts_url
  end

  private

  def user_params
    params.require(:comment).permit(:body)
  end


end