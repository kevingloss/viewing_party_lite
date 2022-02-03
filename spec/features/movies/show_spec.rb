require 'rails_helper'

RSpec.describe 'Movie details page' do
  before :each do
    @eldridge = User.create!(name: 'Eldridge', email: 'eldridge@gmail.com')
    @kevin = User.create!(name: 'Kevin', email: 'kevin@gmail.com')
    @suzie = User.create!(name: 'Suzie', email: 'suzieq@gmail.com')
  end

  xit 'sees button to create viewing party' do

  end

  xit 'has button to return to discover page' do

  end

  it 'sees details about the movie', :vcr do
    visit user_movie_path(@kevin, 49051)

    expect(page).to have_content("The Hobbit: An Unexpected Journey")
  end
end
