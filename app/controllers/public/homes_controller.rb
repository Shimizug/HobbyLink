class Public::HomesController < ApplicationController

  def top
    #最新の投稿4件を取得する
    @new_posts = Post.all.last(4)
    #ランダムでいすれかの投稿を取得する
    if ENV["RAILS_ENV"] == "development" || ENV["RAILS_ENV"] == "test"
      @random_posts = Post.order("RANDOM()").limit(4)
    else
    # mysqlでの実行時
      @random_posts = Post.order("RAND()").limit(4)
    end
  end

  def about
    #最新の投稿4件を表示する
    @new_posts = Post.all.last(4)
   #ランダムでいすれかの投稿を取得する
    if ENV["RAILS_ENV"] == "development" || ENV["RAILS_ENV"] == "test"
      @random_posts = Post.order("RANDOM()").limit(4)
    else
    # mysqlでの実行時
      @random_posts = Post.order("RAND()").limit(4)
    end
  end
end
