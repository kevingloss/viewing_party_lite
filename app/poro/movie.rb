class Movie

  attr_reader :id,
              :title,
              :overview,
              :vote_average,
              :genre,
              :cast,
              :reviews
              #:run_time

  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @overview = data[:overview]
    @vote_average = data[:vote_average]
    @genre = data[:genre]
    @cast = data[:cast]
    @reviews = data[:reviews]
  end
end
