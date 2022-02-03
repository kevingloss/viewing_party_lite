require 'rails_helper'

RSpec.describe 'Movie Detail Service' do
    describe 'class methods' do
        it 'returns the movie attributes', :vcr do
          movie = MovieDetailService.find_movie(49051)
          expect(movie).to be_a(Hash)
          expect(movie.count).to eq(1)
          # binding.pry 
          expect(movie).to have_key(:id)
          expect(movie).to have_key(:title)
          expect(movie).to have_key(:genres)
          expect(movie).to have_key(:overview)
          expect(movie).to have_key(:vote_average)
          expect(movie).to have_key(:runtime)
          expect(movie).to have_key(:poster_path)
        end
    end
end