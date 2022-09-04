class Public::TagsController < ApplicationController
  def index
    @tags = Tag.select(:name).distinct
  end

  def search
    @tag_name = Tag.find(params[:id]).name
    @tags = Tag.where(name: @tag_name)
    post_ids = []
    @tags.each do |tag|
      post_id = tag.posts.pluck(:id)
      post_ids << post_id
    end
   @post_ids = post_ids.flatten

   @posts = Post.find(@post_ids)
  end
end
