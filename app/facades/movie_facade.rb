class MovieFacade
  class << self
    def find_top_rated_movies
      response = MovieService.top_rated_movies

      response.map do |data|
        Movie.new(data)
      end
    end

    def search_movies(keyword)
      response = MovieService.search_title(keyword)

      response.map do |data|
        Movie.new(data)
      end
    end
  end
end
