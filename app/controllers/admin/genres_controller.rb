class Admin::GenresController < ApplicationController

  def create
    @new_genre = Genre.new(genre_params)
    if @new_genre.save
      redirect_to admin_genres_path
    else
      @genres = Genre.all
      render admin_genres_path
    end
  end

  def index
    @new_genre = Genre.new
    @genres = Genre.all
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genres_path
    else
      @genres = Genre.all
      render admin_genres_path
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
