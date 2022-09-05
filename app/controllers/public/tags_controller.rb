class Public::TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def search
  @tag = Tag.find(params[:id])
  @posts = @tag.posts
  end
end
