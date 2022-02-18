# frozen_string_literal: true

require 'rails_helper'

describe 'Discover Page' do
  before :each do
    @eldridge = User.create!(name: 'Eldridge', email: 'eldridge@gmail.com', password: '123', password_confirmation: '123')
    @kevin = User.create!(name: 'Kevin', email: 'kevin@gmail.com', password: '123', password_confirmation: '123')
    @suzie = User.create!(name: 'Suzie', email: 'suzieq@gmail.com', password: '123', password_confirmation: '123')

    visit login_path
    fill_in :email, with: 'kevin@gmail.com'
    fill_in :password, with: '123'
    click_on 'Log In'
  end

  it 'should have the app name and discover movies' do
    visit discover_index_path

    expect(page).to have_content('Viewing Party Lite')
    expect(page).to have_content('Discover Movies')
  end

  it 'has link from top rated movies page', :vcr do
    visit discover_index_path

    click_button('Top Rated Movies')
    click_button('Discover Page')

    expect(current_path).to eq(discover_index_path)
  end

  it 'has a link from the movie details page', :vcr do
    visit movie_path(49_051)

    click_button('Discover Page')

    expect(current_path).to eq(discover_index_path)
  end
end
