class MoviesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    conn = Faraday.new(url: 'https://api.themoviedb.org/3/', params: {api_key: ENV['api_key']})
    response = conn.get('movie/top_rated')
    x = JSON.parse(response.body, symbolize_names: true)
    binding.pry
    #@movies = MovieFacade.filtered_movies
  end
end
