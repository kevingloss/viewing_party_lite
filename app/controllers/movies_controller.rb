class MoviesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    #@movies = MovieFacade.filtered_movies
  end
end