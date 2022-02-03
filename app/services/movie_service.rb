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
        #     movies += (data[:results])
        #     page += 1
        # end
        # movies.take(40)
    end

    def search_title(keyword)
        response = connection.get("/search/movie") do |faraday|
            faraday.params['query'] = keyword
        end
        # binding.pry
        data = parse_json(response)
        
# need to update to max 40 results (add page 1 & 2 together?)
    #   if data[:total_results] <= 20 
    #     movies = data[:results]
    #   elsif data[:total_results] <= 40
    #     response_2 = connection.get("/search/movie?page=1") do |faraday|
    #         faraday.params['query'] = keyword
    #     end
    #     data_2 = parse_json(response_2)
    #     movies = data[:results] + response_2[:results]
    #   end
    end
  end
end