require 'rails_helper'

RSpec.describe ReviewFacade do
  it 'creates review poros for author name and eval', :vcr do
    review = ReviewFacade.author_review(49_051)

    expect(review.first).to be_an_instance_of(Review)
    expect(review.first.author).to eq('Andres Gomez')
  end
end
