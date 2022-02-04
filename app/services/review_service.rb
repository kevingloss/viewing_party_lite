# frozen_string_literal: true

class ReviewService < ApiService
  def self.author_name(movie_id)
    response = connection.get("movie/#{movie_id}/reviews")
    parse_json(response)[:results]
  end
end
