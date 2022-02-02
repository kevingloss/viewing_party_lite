class MovieFacade 
    def search_filter(filter)
        if filter == 'top_rated'
            # top_rated_movies
        elsif filter
            # put in service.search feature
        end
    end

    def top_rated_movies 
        service.top_rated_movies.map do |data|
            Movie.new(data)
        end
    end

    def service 
        MovieService.new
    end
end