# frozen_string_literal: true

require 'rails_helper'

describe 'Discover Page' do
  before :each do
    @eldridge = User.create!(name: 'Eldridge', email: 'eldridge@gmail.com', password: '123', password_confirmation: '123')
    @kevin = User.create!(name: 'Kevin', email: 'kevin@gmail.com', password: '123', password_confirmation: '123')
    @suzie = User.create!(name: 'Suzie', email: 'suzieq@gmail.com', password: '123', password_confirmation: '123')
  end

  it 'should have the app name and discover movies' do
    visit user_discover_index_path(@kevin)

    expect(page).to have_content('Viewing Party Lite')
    expect(page).to have_content('Discover Movies')
  end

  it 'has link from top rated movies page', :vcr do
    visit user_discover_index_path(@eldridge)

    click_button('Top Rated Movies')
    click_button('Discover Page')

    expect(current_path).to eq(user_discover_index_path(@eldridge))
  end

  it 'has a link from the movie details page', :vcr do
    visit user_movie_path(@eldridge, 49_051)

    click_button('Discover Page')

    expect(current_path).to eq(user_discover_index_path(@eldridge))
  end
end
