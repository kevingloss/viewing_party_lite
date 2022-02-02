class MovieService 
    def connection 
        Faraday.new(url: 'https://api.themoviedb.org/3/', params: {api_key: ENV['movie_api_key']})
    end

    def get_url(url)
        response = connection.get(url)
        JSON.parse(response.body, symbolize_names: true)
    end

    def top_rated_movies 
        get_url('movie/top_rated?language=en-US')
    end
end