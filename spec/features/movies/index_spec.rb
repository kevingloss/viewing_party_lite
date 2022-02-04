require 'rails_helper'

RSpec.describe 'Movies index' do
  before :each do
    @eldridge = User.create!(name: 'Eldridge', email: 'eldridge@gmail.com')
    @kevin = User.create!(name: 'Kevin', email: 'kevin@gmail.com')
    @suzie = User.create!(name: 'Suzie', email: 'suzieq@gmail.com')
  end

  it 'has link to discover path', :vcr do

    visit user_discover_index_path(@eldridge)

    click_button("Top Rated Movies")

    expect(current_path).to eq(user_movies_path(@eldridge))
  end

  it 'top rated movies', :vcr do
    visit user_discover_index_path(@eldridge)

    click_button("Top Rated Movies")

    within("#movie-730154") do
      expect(page).to have_content("Your Eyes Tell")
      expect(page).to have_content("Vote Average: 8.8")
    end
  end

  it 'can search by title', :vcr do
    visit user_discover_index_path(@eldridge)

    fill_in(:filter, with: 'Godfather')
    click_on :search

    expect(page).to have_content('Godfather I')
  end

  it 'will return user to discover page if search is left empty', :vcr do 
    visit user_discover_index_path(@eldridge)

    fill_in(:filter, with: '')
    click_on :search 
    
    expect(current_path).to eq(user_discover_index_path(@eldridge))
    expect(page).to have_content('Please enter a valid search query or check out the top rated movies.')
  end

  it 'has links to movie show page', :vcr do
    visit "users/#{@kevin.id}/movies?filter=top_rated"

    click_on "Your Eyes Tell"

    expect(current_path).to eq(user_movie_path(@kevin, 730154))
  end
end
