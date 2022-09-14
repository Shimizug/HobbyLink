class Public::FavoritesController < ApplicationController
  before_action :authenticate_member!

  def index
    @member = Member.find(params[:member_id])
    @favorites = Favorite.where(member_id: @member.id)
    posts_array = []
    @favorites.each do |favorite|
      post = Post.find_by(id: favorite.post_id)
      posts_array << post
    end
    @posts = Kaminari.paginate_array(posts_array).page(params[:page])
  end

  def create
    post = Post.find(params[:post_id])
    favorite = current_member.favorites.new(post_id: post.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_member.favorites.find_by(post_id: post.id)
    favorite.destroy
    redirect_to request.referer
  end
end
