class Admin::FavoritesController < ApplicationController
  before_action :authenticate_admin!
  
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
  
end
