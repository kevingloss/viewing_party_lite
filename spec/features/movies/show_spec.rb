require 'rails_helper'

RSpec.describe 'Movie details page' do
  before :each do
    @eldridge = User.create!(name: 'Eldridge', email: 'eldridge@gmail.com')
    @kevin = User.create!(name: 'Kevin', email: 'kevin@gmail.com')
    @suzie = User.create!(name: 'Suzie', email: 'suzieq@gmail.com')
  end

  it 'sees button to create viewing party', :vcr do
    visit user_movie_path(@kevin, 49051)

    click_button "Create Viewing Party for The Hobbit: An Unexpected Journey"

    expect(current_path).to eq(new_user_movie_party_path(@kevin, 49051))
  end

  it 'sees details about the movie', :vcr do
    visit user_movie_path(@kevin, 49051)

    expect(page).to have_content("The Hobbit: An Unexpected Journey")
  end
end
