class Public::BoardsController < ApplicationController
  before_action :authenticate_member!

  def show
    @board = Board.find(params[:id])
    @board_comment = BoardComment.new
    @board_comments = @board.board_comments.page(params[:page]).per(10)
  end

  def index
    @boards = Board.all.page(params[:page]).per(6)
  end
  
  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    @board.member_id = current_member.id
    if @board.save
      redirect_to board_path(@board), notice: "掲示板が正常に作成されました。"
    else
      redirect_to request.referer
    end
  end

  
  private

  def board_params
    params.require(:board).permit(:title, :body)
  end
end
