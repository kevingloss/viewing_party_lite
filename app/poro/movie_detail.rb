class MovieDetail
    attr_reader :id,
                :title,
                :genres,
                :overview,
                :vote_average,
                :runtime
  
    def initialize(data)
      @id = data[:id]
      @title = data[:title]
      @genres = genre_names(data)
      @runtime = data[:runtime]
      @overview = data[:overview]
      @vote_average = data[:vote_average]
    end

    def genre_names(data)
        data[:genres].map do |genre|
            genre[:name]
        end
    end

    def hr_min_runtime
        "#{@runtime / 60} hr #{@runtime % 60} min"
    end
  end
  