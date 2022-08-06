class Public::HomesController < ApplicationController
  def top
    @new_posts = Post.all.last(4)
  end

  def about
  end
end
