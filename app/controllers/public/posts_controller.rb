class Public::PostsController < ApplicationController
  before_action :authenticate_member!
  before_action :ensure_correct_member, only: [:edit, :update, :destroy]

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @post_comments = @post.post_comments.page(params[:page])
  end

  def index
    @posts = Post.all.page(params[:page])
  end
  
  def new
    @post = Post.new
    @genres = Genre.all
  end

  def create
    @post = Post.new(post_params)
    @post.member_id = current_member.id
    if @post.save
      tags = Vision.get_image_data(post.image)
      tags.each do |tag|
        post.tags.create(name: tag)
      end
      redirect_to post_path(@post), notice: "投稿が正常に作成されました。"
    else
      redirect_to request.referer
    end
  end

  def edit
    @genres = Genre.all
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "投稿が正常に更新されました。"
    else
      redirect_to request.referer
    end
  end

  def destroy
    if @post.destroy
      redirect_to posts_path, notice: "投稿が正常に削除されました。"
    else
      redirect_to request.referer
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image, :genre_id)
  end

  def ensure_correct_member
    @post = Post.find(params[:id])
    unless @post.member == current_member
      redirect_to posts_path
    end
  end
end
