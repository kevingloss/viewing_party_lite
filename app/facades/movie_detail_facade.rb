class MovieDetailFacade
    class << self
      def movie_details(movie_id)
          json = MovieDetailService.find_movie(movie_id)
          
          json[:results].map do |data|
              MovieDetail.new(data)
          end
      end
    end
  end