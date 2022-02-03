class ReviewService
  def self.connection
    Faraday.new(url: 'https://api.themoviedb.org/3/') do |faraday|
      faraday.params['api_key'] = ENV['movie_api_key']
    end
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.author_name(movie_id)
    response = connection.get("movie/#{movie_id}/reviews")
    parse_json(response)[:results]
  end
end
