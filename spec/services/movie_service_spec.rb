# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Movie Service' do
  describe 'class methods' do
    it 'returns the top rated movies', :vcr do
      movies = MovieService.top_rated_movies
      expect(movies).to be_a(Array)
      expect(movies[0][:title]).to eq('Your Eyes Tell')
    end

    it 'searches for movies', :vcr do
      movies = MovieService.search_title('The Godfather')

      expect(movies[0][:title]).to eq('The Godfather')
      expect(movies[0]).to be_a(Hash)
      expect(movies[0]).to have_key(:id)
      expect(movies[0]).to have_key(:title)
      expect(movies[0]).to have_key(:overview)
      expect(movies[0]).to have_key(:vote_average)
    end
  end
end
