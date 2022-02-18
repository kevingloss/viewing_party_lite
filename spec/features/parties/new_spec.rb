# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'New Party' do
  before :each do
    @eldridge = User.create!(name: 'Eldridge', email: 'eldridge@gmail.com', password: '123', password_confirmation: '123')
    @kevin = User.create!(name: 'Kevin', email: 'kevin@gmail.com', password: '123', password_confirmation: '123')
    @suzie = User.create!(name: 'Suzie', email: 'suzieq@gmail.com', password: '123', password_confirmation: '123')

    visit login_path
    fill_in :email, with: 'kevin@gmail.com'
    fill_in :password, with: '123'
    click_on 'Log In'
  end

  it 'has a link back to the discover page', :vcr do
    visit new_movie_party_path(49_051)

    click_button 'Discover Page'

    expect(current_path).to eq(discover_index_path)
  end

  it 'can create a new party', :vcr do
    visit new_movie_party_path(49_051)

    fill_in(:duration, with: 180)
    fill_in(:date, with: '2022-02-03')
    fill_in(:start_time, with: '21:47')

    check(@eldridge.name)

    click_on 'Create Party'

    expect(current_path).to eq(dashboard_path)
  end

  it 'will redirect to new page on failed creation', :vcr do
    visit new_movie_party_path(49_051)

    fill_in(:duration, with: 10)
    fill_in(:date, with: '2022-02-14')
    fill_in(:start_time, with: '21:47')

    check(@eldridge.name)

    click_on 'Create Party'

    expect(current_path).to eq(new_movie_party_path(49_051))
    expect(page).to have_content('Please check the duration is longer than the movie runtime.')
  end
end
