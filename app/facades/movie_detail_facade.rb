class MovieDetailFacade
    class << self
      def movie_details(movie_id)
          response = MovieDetailService.find_movie(movie_id)
          
          response.map do |data|
              MovieDetail.new(data)
          end
      end
    end
  end