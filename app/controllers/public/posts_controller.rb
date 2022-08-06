class Public::PostsController < ApplicationController
  before_action :ensure_correct_member, only: [:edit, :update, :destroy]

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def index
    @genres = Genre.all
    @posts = Post.page(params[:page]).per(5)
  end

  def create
    @post = Post.new(post_params)
    @post.member_id = current_member.id
    if @post.save
      redirect_to post_path(@post), notice: "You have created post successfully."
    else
      @posts = Post.all
      render 'index'
    end
  end
  
  def new
    @post = Post.new
  end
  
  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "You have updated post successfully."
    else
      render "edit"
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def ensure_correct_member
    @post = Post.find(params[:id])
    unless @post.member == current_member
      redirect_to posts_path
    end
  end
end
