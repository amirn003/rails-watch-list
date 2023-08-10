class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @movies = Movie.all
    @bookmark = Bookmark.new
  end

  def create
    movie_id = Movie.find(params[:bookmark][:movie_id])
    list_id = List.find(params[:bookmark][:list_id][1])

    @bookmark = Bookmark.new(set_bookmark)
    @bookmark.movie = movie_id
    @bookmark.list = list_id
    if @bookmark.save
      redirect_to lists_path(movie_id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_bookmark
    params.require(:bookmark).permit(:comment)

  end


end
