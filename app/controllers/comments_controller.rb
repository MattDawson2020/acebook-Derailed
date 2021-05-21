require './app/helpers/sessions_helper.rb'
class CommentsController < ApplicationController
  
  def new
    @comment = Comment.new
    @user = User.find_by(params[:user_id])
    @post = Post.find_by(params[:post_id])
  end

  def create
    # @user = User.find_by(params[:user_id])
    # @post = Post.find_by(params[:post_id])
    # @comment = @post.comments.create(comments_params)
    @comment = Comment.create(comments_params)
    redirect_to posts_url
  end

  private

  def comments_params
    params.require(:comment).permit(:body, :post_id, :user_id)
  end

end
