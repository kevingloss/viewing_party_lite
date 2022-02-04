class ReviewFacade
  def self.author_review(movie_id)
    service = ReviewService.author_name(movie_id)
    service.map do |author|
      Review.new(author)
    end
  end
end
