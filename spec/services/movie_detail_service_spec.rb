# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Movie Detail Service' do
  describe 'class methods' do
    it 'returns the movie attributes', :vcr do
      movie = MovieDetailService.find_movie(49_051)
      expect(movie).to be_a(Hash)
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
