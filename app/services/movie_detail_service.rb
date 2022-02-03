class MovieDetailService < ApiService
    class << self 
        def find_movie(movie_id)
            response = connection.get("/movie/#{movie_id}")
            data = parse_json(response)[:results]
        end
    end
end