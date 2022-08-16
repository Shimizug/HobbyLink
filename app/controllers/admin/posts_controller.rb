class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  before_action :ensure_post, only: [:show, :destroy]

  def show
    @post_comment = PostComment.new
    @post_comments = @post.post_comments.page(params[:page])
  end

  def index
    @posts = Post.all.page(params[:page])
  end

  def destroy
    if @post.destroy
      redirect_to admin_posts_path, notice: "会員が正常に削除されました。"
    else
      redirect_to request.referer
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image, :genre_id)
  end

  def ensure_post
    @post = Post.find(params[:id])
  end
end
