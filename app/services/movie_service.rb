class MovieService < ApiService
  class << self

    def top_rated_movies
      response = connection.get("/movie/top_rated")
      parse_json(response)

        # movies = []
        # page = 1
        # while movies.count < 40
        #     response = connection.get("/movie/top_rated?page=#{page}")
        #     data = parse_json(response)
        #     movies.push(data[:results]).flatten!
        #     page += 1
        # end
        # movies.take(40)
    end

    # need to update to max 40 results (add page 1 & 2 together?)
    def search_title(keyword)
        response = connection.get("/search/movie") do |faraday|
            faraday.params['query'] = keyword
        end
        # binding.pry
      parse_json(response)
    end

    def find_movie(movie_id)
      response = connection.get("/movie/#{movie_id}")
      parse_json(response)
    end
  end
end
