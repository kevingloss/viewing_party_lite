class MovieDetailService < ApiService
    class << self 
        def find_movie(movie_id)
            response = connection.get("/movie") do |faraday|
                faraday.params['movie_id'] = movie_id
            end
            data = parse_json(response)
            binding.pry
        end
    end
end