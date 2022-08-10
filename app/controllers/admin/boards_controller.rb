class Admin::BoardsController < ApplicationController
  before_action :authenticate_admin!
  before_action :ensure_correct_member, only: [:edit, :update, :destroy]

  def show
    @board = Board.find(params[:id])
    @board_comment = BoardComment.new
    @board_comments = BoardComment.all.page(params[:page]).per(10)
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

  def edit
  end

  def update
    if @board.update(board_params)
      redirect_to board_path(@board), notice: "You have updated board successfully."
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

  def ensure_correct_member
    @board = Board.find(params[:id])
    unless @board.member == current_member
      redirect_to boards_path
    end
  end
end
