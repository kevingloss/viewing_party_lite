# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Movies index' do
  before :each do
    @eldridge = User.create!(name: 'Eldridge', email: 'eldridge@gmail.com', password: '123', password_confirmation: '123')
    @kevin = User.create!(name: 'Kevin', email: 'kevin@gmail.com', password: '123', password_confirmation: '123')
    @suzie = User.create!(name: 'Suzie', email: 'suzieq@gmail.com', password: '123', password_confirmation: '123')

    visit login_path
    fill_in :email, with: 'kevin@gmail.com'
    fill_in :password, with: '123'
    click_on 'Log In'
  end

  it 'has link to discover path', :vcr do
    visit discover_index_path

    click_button('Top Rated Movies')

    expect(current_path).to eq(movies_path)
  end

  it 'top rated movies', :vcr do
    visit discover_index_path

    click_button('Top Rated Movies')

    within('#movie-730154') do
      expect(page).to have_content('Your Eyes Tell')
      expect(page).to have_content('Vote Average: 8.7')
    end
  end

  it 'can search by title', :vcr do
    visit discover_index_path

    fill_in(:filter, with: 'Godfather')
    click_on :search

    expect(page).to have_content('Godfather I')
  end

  it 'will return user to discover page if search is left empty', :vcr do
    visit discover_index_path

    fill_in(:filter, with: '')
    click_on :search

    expect(current_path).to eq(discover_index_path)
    expect(page).to have_content('Please enter a valid search query or check out the top rated movies.')
  end

  it 'has links to movie show page', :vcr do
    visit "/movies?filter=top_rated"

    click_on 'Your Eyes Tell'

    expect(current_path).to eq(movie_path(730_154))
  end
end
