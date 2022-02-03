require 'rails_helper'

RSpec.describe 'Movie Service' do
    describe 'class methods' do
        it 'returns the top rated movies', :vcr do
          service = MovieService.top_rated_movies
          expect(service).to be_a(Hash)
          expect(service[:results][0][:title]).to eq("Your Eyes Tell")
          expect(service[:results].count).to eq(40)
        end

        it 'searches for movies', :vcr do
          service = MovieService.search_title('The Godfather')
          expect(service[:results][0][:title]).to eq('The Godfather')
        end
    end
end
