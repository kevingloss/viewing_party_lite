class Movie
  attr_reader :id,
              :title,
              :overview,
              :vote_average

  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @overview = data[:overview]
    @vote_average = data[:vote_average]
  end
end
