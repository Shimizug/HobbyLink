class Admin::BoardCommentsController < ApplicationController
  before_action :authenticate_admin!
  
  def create
    @board = Board.find(params[:board_id])
    comment = current_admin.board_comments.new(board_comment_params)
    comment.board_id = @board.id
    comment.save
    @board_comments = @board.board_comments.page(params[:page]).per(10)
  end

  def destroy
    BoardComment.find_by(id: params[:id], board_id: params[:board_id]).destroy
    @board = Board.find(params[:board_id])
    @board_comments = @board.board_comments.page(params[:page]).per(10)
  end

  private
  def board_comment_params
    params.require(:board_comment).permit(:comment)
  end
end
