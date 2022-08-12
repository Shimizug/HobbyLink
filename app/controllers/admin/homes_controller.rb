class Admin::HomesController < ApplicationController
  def top
    @boards = Board.all.page(params[:page])
  end
end
