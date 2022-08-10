class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @posts = Post.all.page(params[:page]).per(4)
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @post_comments = @post.post_comments.page(params[:page]).per(4)
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path
  end
  
  private

  def post_params
    params.require(:post).permit(:title, :body, :image, :genre_id)
  end
end
