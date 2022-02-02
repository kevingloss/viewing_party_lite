class MovieService 
    def connection 
        Faraday.new(url: 'https://api.themoviedb.org/3/', params: {api_key: ENV['api_key']})
    end

    def get_url(url)
        response = connection.url)
        x = JSON.parse(response.body, symbolize_names: true)
        binding.pry
    end

    def top_rated_movies 
        get_url('movie/top_rated?language=en-US')
    end
end