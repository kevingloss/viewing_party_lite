require 'rails_helper'

RSpec.describe 'Movie Service' do 
    describe 'class methods' do 
        it 'connects with faraday', :vcr do 
            facade = MovieFacade.new
            expect(facade.top_rated_movies).to eq('kdf')
        end
    end

end