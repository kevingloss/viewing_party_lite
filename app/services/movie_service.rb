class MovieService < ApiService
  class << self

    # need to update to max 40 results (add page 1 & 2 together?)
    def top_rated_movies
      response = connection.get("/movie/top_rated")
      parse_json(response)
        # data = get_url('movie/top_rated?language=en-US')
        # data[:results]
    end

    # need to update to max 40 results (add page 1 & 2 together?)
    def search_title(keyword)
      response = connection.get("/search/movie") do |faraday|
        faraday.params['query'] = keyword
      end
      parse_json(response)
        # data = get_url("search/movie?language=en-US&query=#{keyword}&page=1&include_adult=false")
        # data[:results]
    end

    def find_movie(movie_id)
      get_url("/movie/#{movie_id}?language=en-US")
    end
  end
end
