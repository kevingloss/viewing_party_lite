# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Movie details page' do
  before :each do
    @eldridge = User.create!(name: 'Eldridge', email: 'eldridge@gmail.com', password: '123', password_confirmation: '123')
    @kevin = User.create!(name: 'Kevin', email: 'kevin@gmail.com', password: '123', password_confirmation: '123')
    @suzie = User.create!(name: 'Suzie', email: 'suzieq@gmail.com', password: '123', password_confirmation: '123')

    visit login_path
    fill_in :email, with: 'kevin@gmail.com'
    fill_in :password, with: '123'
    click_on 'Log In'
  end

  it 'sees button to create viewing party', :vcr do
    visit movie_path(49_051)

    click_button 'Create Viewing Party for The Hobbit: An Unexpected Journey'

    expect(current_path).to eq(new_movie_party_path(49_051))
  end

  it 'sees details about the movie', :vcr do
    visit movie_path(49_051)

    summary = 'Bilbo Baggins, a hobbit enjoying his quiet life'
    review = 'An other great master peace has been added the the Lord of The Rings'

    expect(page).to have_content('The Hobbit: An Unexpected Journey')
    expect(page).to have_content('7.3')
    expect(page).to have_content('Runtime: 2 hr 49 min')
    expect(page).to have_content('Adventure, Fantasy, Action')
    expect(page).to have_content(summary)
    expect(page).to have_content('Ian McKellen as Gandalf')
    expect(page).to have_content('Martin Freeman as Bilbo Baggins')
    expect(page).to have_content('4 Reviews')
    expect(page).to have_content('GeekMasher')
    expect(page).to have_content(review)
  end
end
