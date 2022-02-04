class Review
  attr_reader :author,
              :eval

  def initialize(data)
    @author = data[:author]
    @eval = data[:content]
  end
end
