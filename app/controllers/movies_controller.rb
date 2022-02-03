class MoviesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    if params[:filter] == 'top_rated'
      @movies = MovieFacade.find_top_rated_movies
      @page_title = 'Top Rated Movies'
    elsif params[:filter]
      @movies =  MovieFacade.search_movies(params[:filter])
      @page_title = "Search results for: #{params[:filter]}"
    end
  end

  def show
    @user = User.find(params[:user_id])
    @movie = facade.movie_details(params[:id])
  end
end
