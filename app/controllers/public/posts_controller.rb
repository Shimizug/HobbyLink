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
    @genres = Genre.all
  end
  
  #投稿一覧をジャンルで絞り込む
  def genre_posts
    @genre = Genre.find(params[:id])
    @posts = @genre.posts.page(params[:page])
  end
    
  def new
    @post = Post.new
    @genres = Genre.all
  end

  def create
    @post = Post.new(post_params)
    @post.member_id = current_member.id
    if @post.save
      if @post.image.attached?
        tags = Vision.get_image_data(@post.image)
        @post.save_tags(tags)
      end
      redirect_to post_path(@post), notice: "投稿が正常に作成されました。"
    else
      @genres = Genre.all
      render :new
    end
  end

  def edit
    @genres = Genre.all
  end

  def update
    if @post.update(post_params)
      if @post.image.attached?
        @post.tags.destroy_all
        tags = Vision.get_image_data(@post.image)
        @post.save_tags(tags)
      end
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
