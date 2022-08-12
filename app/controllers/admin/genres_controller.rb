class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!
  before_action :ensure_genre, only: [:edit, :update]
  
  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to request.referer, notice: "ジャンルが正常に作成されました。"
  end

  def edit
  end

  def update
    if @genre.update(genre_params)
      redirect_to admin_genres_path, notice: "ジャンルが正常に更新されました。"
    else 
      redirect_to request.referer
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name, :body)
  end
  
  def ensure_genre
    @genre = Genre.find(params[:id])
  end
    
end
