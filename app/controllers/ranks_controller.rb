class RanksController < ApplicationController
  def rank
    @post_favorite_ranks = Post.find(Favorite.group(:post_id).order("count(post_id) desc").pluck(:post_id))#投稿のいいね数ランキング
    @post_comment_ranks = Post.find(PostComment.group(:post_id).order('count(post_id) desc').pluck(:post_id))#投稿のコメント数ランキング
    @p
    
  end
  
  

end
