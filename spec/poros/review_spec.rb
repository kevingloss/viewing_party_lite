require 'rails_helper'

RSpec.describe Review do

  it 'has attributes' do
    data = {
      author: 'critic 1',
      eval: 'good movie'
    }

    review = Review.new(data)

    expect(review).to be_a(Review)
    expect(review.author).to eq('critic 1')
    expect(review.eval).to eq('good movie')
  end
end
