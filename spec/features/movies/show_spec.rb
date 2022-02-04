# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Movie details page' do
  before :each do
    @eldridge = User.create!(name: 'Eldridge', email: 'eldridge@gmail.com')
    @kevin = User.create!(name: 'Kevin', email: 'kevin@gmail.com')
    @suzie = User.create!(name: 'Suzie', email: 'suzieq@gmail.com')
  end

  it 'sees button to create viewing party', :vcr do
    visit user_movie_path(@kevin, 49_051)

    click_button 'Create Viewing Party for The Hobbit: An Unexpected Journey'

    expect(current_path).to eq(new_user_movie_party_path(@kevin, 49_051))
  end

  it 'sees details about the movie', :vcr do
    visit user_movie_path(@kevin, 49_051)

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
