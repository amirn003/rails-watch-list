class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @movies = Movie.all
    @bookmark = Bookmark.new
  end

  def create
    movie_id = Movie.find(params[:bookmark][:movie_id])
    list_id = List.find(params[:list_id])
    @bookmark = Bookmark.new(set_bookmark)
    @bookmark.movie = movie_id
    @bookmark.list = list_id
    if @bookmark.save
      redirect_to list_path(list_id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    bookmark_list = @bookmark.list.id
    @bookmark.destroy
    redirect_to list_path(bookmark_list), notice: 'Delete successfully!'
  end

  private

  def set_bookmark
    params.require(:bookmark).permit(:comment)

  end


end
