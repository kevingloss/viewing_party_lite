require 'rails_helper'

RSpec.describe 'Movie Service' do 
    describe 'class methods' do 
        it 'returns the top rated movies', :vcr do 
            service = MovieService.new
            yml = File.read('spec/fixtures/vcr_cassettes/movie_service/class_methods/returns_the_top_rated_movies.yml')
            expect(service.top_rated_movies).to be_a(Hash)
            expect(service.top_rated_movies[:results][0][:title]).to eq("Your Eyes Tell")
        end
    end
end