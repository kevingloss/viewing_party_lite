class MovieFacade
    # def search_filter(filter)
    #     if filter == 'top_rated'
    #         find_top_rated_movies
    #     elsif filter
    #         search_movies(filter)
    #     end
    # end

    def self.find_top_rated_movies
      service = MovieService.top_rated_movies

      service[:results].map do |data|
        Movie.new(data)
      end
    end

    # def search_movies(keyword)
    #     service.search_title(keyword).map do |data|
    #         Movie.new(data)
    #     end
    # end
    #
    # def movie_details(movie_id)
    #   service.find_movie(movie_id).map do |data|
    #     Movie.new(data)
    #   end
    # end

    # def service
    #     MovieService.new
    # end
end
