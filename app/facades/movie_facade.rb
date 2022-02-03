class MovieFacade
  class << self
    def find_top_rated_movies
        json = MovieService.top_rated_movies

        json[:results].map do |data|
            Movie.new(data)
        end
    end

    def search_movies(keyword)
        json = MovieService.search_title(keyword)
        
        json[:results].map do |data|
            Movie.new(data)
        end
    end
  end
end
