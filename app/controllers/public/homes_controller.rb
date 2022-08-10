class Public::HomesController < ApplicationController
  
  def top
    @new_posts = Post.all.last(5)
    @random_posts = Post.order("RANDOM()").limit(3)
    # mysqlでの実行時
    # @random_posts = Post.order("RAND()").limit(4)
  end

  def about
    @new_posts = Post.all.last(4)
    @random_posts = Post.order("RANDOM()").limit(3)
     # mysqlでの実行時
    # @random_posts = Post.order("RAND()").limit(4)
  end
end
