class MoviesController < ApplicationController

  def index
    @movies = Movie.order('title')
    @bookmark = Bookmark.new
  end
end
