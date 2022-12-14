class Public::PostCommentsController < ApplicationController
  before_action :authenticate_member!

  def create
    @post = Post.find(params[:post_id])
    comment = current_member.post_comments.new(post_comment_params)
    comment.post_id = @post.id
    comment.save
    @post_comments = @post.post_comments.page(params[:page]).per(10)
  end

  def destroy
    PostComment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    @post = Post.find(params[:post_id])
    @post_comments = @post.post_comments.page(params[:page]).per(10)
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
