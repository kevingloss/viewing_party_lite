class MoviesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
# binding.pry
    @movies = facade.search_filter(params[:filter])
    
  end

  def facade 
    MovieFacade.new
  end
end
