class MoviesController < ApplicationController

  def index
    @user = User.find(params[:user_id])

    # Next 3 lines work
    # conn = Faraday.new("https://api.themoviedb.org")
    # response = conn.get("/3/movie/top_rated?api_key=09ebf0fa4e1ae6359be80bb97f58a428&page=1")
    # @top_movies = JSON.parse(response.body, symbolize_names: true)
    
    conn = Faraday.new("https://api.themoviedb.org/3/", params: {api_key: ENV['movie_api_key']})
    
    response = conn.get("movie/#{params[:filter]}/?language=en-US")
    # response = conn.get('movie/top_rated?api_key=09ebf0fa4e1ae6359be80bb97f58a428&language=en-US&page=1')
    data = JSON.parse(response.body, symbolize_names: true)
    binding.pry
    # results = data[:results]
    # @movies = results.map do |data|
    #    Movie.new(data)
    # end
  end
end
