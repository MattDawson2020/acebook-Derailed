class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(message: post_params, user_id: session[:user_id])
    redirect_to posts_url
  end

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def like
    Post.like(params[:id])
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:message)[:message]
  end
end
