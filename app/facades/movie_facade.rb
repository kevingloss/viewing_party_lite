class MovieFacade 
    def search_filter(filter)
        if filter == 'top_rated'
            find_top_rated_movies
        elsif filter
            search_movies(filter)
        end
    end

    def find_top_rated_movies 
        service.top_rated_movies.map do |data|
            Movie.new(data)
        end
    end

    def search_movies(keyword)
        service.search_title(keyword).map do |data|
            Movie.new(data)
        end
    end

    def service 
        MovieService.new
    end
end