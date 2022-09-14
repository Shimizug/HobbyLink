class Admin::HomesController < ApplicationController
  def top
     @posts = Post.all.page(params[:page])
     @genres = Genre.all
  end
end
