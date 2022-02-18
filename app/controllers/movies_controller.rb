# frozen_string_literal: true

class MoviesController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    if params[:filter] == ''
      flash[:alert] = 'Please enter a valid search query or check out the top rated movies.'
      redirect_to discover_index_path
    elsif params[:filter] == 'top_rated'
      @movies = MovieFacade.find_top_rated_movies
      @page_title = 'Top Rated Movies'
    elsif params[:filter]
      @movies = MovieFacade.search_movies(params[:filter])
      @page_title = "Search results for: #{params[:filter]}"
    end
  end

  def show
    @user = User.find(session[:user_id])
    @movie = MovieDetailFacade.movie_details(params[:id])
    @cast = CastMemberFacade.starring(@movie.id)
    @reviews = ReviewFacade.author_review(@movie.id)
  end
end
