class Admin::GenresController < ApplicationController
  before_action :genre_member, only: [:edit, :update]
  
  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to request.referer
  end

  def edit
  end

  def update
    @genre.update(genre_params)
    redirect_to admin_genres_path
  end

  private

  def genre_params
    params.require(:genre).permit(:name, :body)
  end
  
  def genre_member
    @genre = Genre.find(params[:id])
  end
    
end
