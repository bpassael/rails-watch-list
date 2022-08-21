class BookmarksController < ApplicationController

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def index
    @bookmarks = Bookmark.all
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    if @bookmark.valid?
      @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def new_from_movie
    @bookmark = Bookmark.new
    @movie = Movie.find(params[:movie_id])
  end

  def create_from_movie
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.movie_id = params[:movie_id]
    if @bookmark.valid?
      @bookmark.save
      redirect_to root_path
    else
      # render :new ## bug et me redirect sur la view de "new" au lieu de "new_from_movie"
      redirect_to root_path

    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(params[:list_id]), status: :see_other
  end


  private


  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end



end
