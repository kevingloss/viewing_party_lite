# frozen_string_literal: true

class MovieService < ApiService
  class << self
    def top_rated_movies
      movies = []
      page = 1
      while movies.count < 40
        response = connection.get("movie/top_rated?page=#{page}")
        data = parse_json(response)
        movies += (data[:results])
        page += 1
      end
      movies.take(40)
    end

    def search_title(keyword)
      response = connection.get('search/movie') do |faraday|
        faraday.params['query'] = keyword
      end
      data = parse_json(response)

      if data[:results].count == data[:total_results]
        movies = data[:results]
      elsif data[:results].count <= 40
        response_2 = connection.get('search/movie?page=2') do |faraday|
          faraday.params['query'] = keyword
        end
        data_2 = parse_json(response_2)
        movies = data[:results] + data_2[:results]
      end
    end
  end
end
