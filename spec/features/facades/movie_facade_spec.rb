require 'rails_helper'

RSpec.describe MovieFacade do

  it 'creates movie poros for top rated movies', :vcr do
    movies = MovieFacade.find_top_rated_movies
    
    expect(movies.first).to be_an_instance_of(Movie)
    expect(movies.first.title).to eq('Your Eyes Tell')
    expect(movies.first.vote_average).to eq(8.8)
  end
end
