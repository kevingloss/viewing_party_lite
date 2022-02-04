# frozen_string_literal: true

class MovieDetailFacade
  class << self
    def movie_details(movie_id)
      response = MovieDetailService.find_movie(movie_id)

      MovieDetail.new(response)
    end
  end
end
