require 'rails_helper'

RSpec.describe 'Movie Service' do 
    describe 'class methods' do 
        it 'connects with faraday', :vcr do 
            expect(MovieFacade.movies).to eq('kdf')
        end
    end

end