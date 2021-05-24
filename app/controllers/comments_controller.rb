class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @user = User.find_by(params[:user_id])
    @post = Post.find_by(id: params[:format])
  end

  def create
    @comment = Comment.create(comment_params)
    redirect_to posts_url
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id, :post_id)
  end
end
