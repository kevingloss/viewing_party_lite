class MovieFacade

    def self.find_top_rated_movies
      service = MovieService.top_rated_movies

      service[:results].map do |data|
        Movie.new(data)
      end
    end

    def search_movies(keyword)
        service = MovieService.search_title(keyword)
        
        service[:results].map do |data|
            Movie.new(data)
        end
    end
    
    def movie_details(movie_id)
        service = MovieService.find_movie(movie_id)
        
        service[:results].map do |data|
            Movie.new(data)
        end
    end
end
