require 'rails_helper'

RSpec.describe MovieDetailFacade do

  it 'creates a movie detail poro', :vcr do
    movie = MovieDetailFacade.movie_details(49051)
    
    expect(movie).to be_an_instance_of(MovieDetail)
    expect(movie.title).to eq("The Hobbit: An Unexpected Journey")
  end
end