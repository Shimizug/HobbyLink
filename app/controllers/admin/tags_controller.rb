class Admin::TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def search
    @tag = Tag.find(params[:id])
		@posts = @tag.posts.page(params[:page])
  end
end
