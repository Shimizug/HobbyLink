class RanksController < ApplicationController
  def rank
    @post_favorite_ranks = Post.find(Favorite.group(:post_id).order("count(post_id) desc").limit(10).pluck(:post_id))#投稿のいいね数ランキング
    @post_comment_ranks = Post.find(PostComment.group(:post_id).order('count(post_id) desc').limit(10).pluck(:post_id))#投稿のコメント数ランキング
    @member_followed_ranks = Member.find(Relationship.group(:followed_id).order('count(followed_id) desc').limit(10).pluck(:followed_id))#フォロワー数ランキング
  end
end


