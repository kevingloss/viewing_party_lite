class MovieService 
    def connection 
        Faraday.new(url: 'https://api.themoviedb.org/3/', params: {api_key: ENV['movie_api_key']})
    end

    def get_url(url)
        response = connection.get(url)
        JSON.parse(response.body, symbolize_names: true)
    end
    # need to update to max 40 results (add page 1 & 2 together?)
    def top_rated_movies 
        data = get_url('movie/top_rated?language=en-US')
        data[:results]
    end
    
    # need to update to max 40 results (add page 1 & 2 together?)
    def search_title(keyword)
        data = get_url("search/movie?language=en-US&query=#{keyword}&page=1&include_adult=false")
        data[:results]
    end
end