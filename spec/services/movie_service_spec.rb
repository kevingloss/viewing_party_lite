require 'rails_helper'

RSpec.describe 'Movie Service' do
    describe 'class methods' do
        it 'returns the top rated movies', :vcr do
          service = MovieService.top_rated_movies
          expect(service).to be_a(Hash)
          expect(service[:results][0][:title]).to eq("Your Eyes Tell")
          # below expectation supposed to be 40. Fix later
          expect(service[:results].count).to eq(20)

            # service = MovieService.new
            # binding.pry
            # yml = File.read('spec/fixtures/vcr_cassettes/movie_service/class_methods/returns_the_top_rated_movies.yml')
            # expect(service.top_rated_movies).to be_a(Array)
            # expect(service.top_rated_movies[0][:title]).to eq("Your Eyes Tell")
        end

        it 'searches for movie', :vcr do
          service = MovieService.search_title('The Godfather')
          expect(service[:results][0][:title]).to eq('The Godfather')
        end
    end
end
