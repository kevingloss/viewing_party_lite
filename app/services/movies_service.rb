class MovieService 
    def connection 
        conn = Faraday.new(url: 'https://api.themoviedb.org/3/', params: {api_key: ENV['api_key']})
        end
    end

    def get_url(url)
        response = connection.get(url)
        JSON.parse(response.body, symbolize_names: true)
    end

    def top_rated_movies 
        get_url('movie/top_rated')
    end
end