class Admin::BoardsController < ApplicationController
  before_action :authenticate_admin!
  before_action :ensure_admin, only: [:show, :edit, :update, :destroy]

  def show
    @board_comment = BoardComment.new
    @board_comments = @board.board_comments.page(params[:page]).per(10)
  end

  def index
    @boards = Board.all.page(params[:page])
  end
  
  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    @board.member_id = current_admin.id
    if @board.save
      redirect_to admin_board_path(@board), notice: "掲示板が正常に作成されました。"
    else
      redirect_to referer
    end
  end

  def edit
  end

  def update
    if @board.update(board_params)
      redirect_to admin_board_path(@board), notice: "掲示板が正常に更新されました。"
    else
      redirect_to referer
    end
  end

  def destroy
    if @board.destroy
      redirect_to admin_boards_path, notice: "掲示板が正常に削除されました"
    else
      redirect_to referer
    end
  end

  private

  def board_params
    params.require(:board).permit(:title, :body)
  end

  def ensure_admin
    @board = Board.find(params[:id])
  end
end
