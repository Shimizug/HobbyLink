class Public::BoardsController < ApplicationController
  before_action :authenticate_member!

  def show
    @board = Board.find(params[:id])
    @board_comment = BoardComment.new
    @board_comments = BoardComment.all.page(params[:page]).per(25)
  end

  def index
    @boards = Board.all.page(params[:page]).per(2)
  end

  def create
    @board = Board.new(board_params)
    @board.member_id = current_member.id
    if @board.save
      redirect_to board_path(@board), notice: "You have created board successfully."
    else
      redirect_to referer
    end
  end

  def new
    @board = Board.new
  end

  private

  def board_params
    params.require(:board).permit(:title, :body)
  end
end
