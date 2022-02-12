class Admin::GenresController < ApplicationController
before_action :admin_signed_in_or_root

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to admin_genres_path
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to admin_genres_path
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to admin_genres_path
  end

  private

    def genre_params
      params.require(:genre).permit(:genre_name)
    end

    def admin_signed_in_or_root
      unless admin_signed_in?
        #管理者ログインしていない場合はtopページに行く
        redirect_to root_path
      end
    end
end
