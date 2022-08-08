class Public::BoardsController < ApplicationController
  before_action :authenticate_me!
  before_action :ensure_correct_member, only: [:edit, :update, :destroy]
  
  def show
    @board = Board.find(params[:id])
    @board_comment = BoardComment.new
    @board_comments = BoardComment.page(@arams[:page]).per(25)
  end
  
  def index
    @boards = Board.page(params[:page]).per(5)
  end
  
  def create
    @board = Board.new(board_params)
    @board.member_id = current_member.id
    if @board.save
      redirect_to board_path(@board), notice: "You have created board successfully."
    else
      @boards = Board.all
      render 'index'
    end
  end

  def edit
  end
  
  def update
    if @board.update(board_params)
      redirect_to board_path(@board), notice: "You have updated board successfully."
    else
      render "edit"
    end
  end

  def new
    @board = Board.new
  end
  
  # def destroy
  #   @board.destroy
  #   redirect_to boards_path
  # end
  
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
