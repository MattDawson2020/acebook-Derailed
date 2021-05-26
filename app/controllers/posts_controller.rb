class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(message: post_params, user_id: session[:user_id])
    @post.post_image.attach(params[:post][:post_image])
    redirect_to posts_url
  end

  def index
    redirect_to "/" unless session[:user_id]
    @posts = Post.all.order(created_at: :desc)
    @comments = Comment.all
  end

  def like
    Post.like(params[:id])
    redirect_to posts_url
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:deletion] = "Post deleted"
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:message)[:message]
  end
  
end
