class Public::HomesController < ApplicationController

  def top
    #最新の投稿4件を取得する
    @new_posts = Post.all.last(4)
    #ランダムでいすれかの投稿を取得する
    @random_posts = Post.order("RANDOM()").limit(4)
    # mysqlでの実行時
    # @random_posts = Post.order("RAND()").limit(4)
  end

  def about
    #最新の投稿4件を表示する
    @new_posts = Post.all.last(4)
    #ランダムでいすれかの投稿を取得する
    @random_posts = Post.order("RANDOM()").limit(4)
     # mysqlでの実行時
    # @random_posts = Post.order("RAND()").limit(4)
  end
end
