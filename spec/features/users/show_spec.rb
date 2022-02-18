# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Show Page' do
  before :each do
    party = Party.create(duration: 180, date: '2022-02-03', start_time: '21:47', movie_id: 49_051)
    party_2 = Party.create(duration: 120, date: '2022-02-14', start_time: '19:47', movie_id: 57_021)
    @eldridge = User.create!(name: 'Eldridge', email: 'eldridge@gmail.com', password: '123', password_confirmation: '123')
    @kevin = User.create!(name: 'Kevin', email: 'kevin@gmail.com', password: '123', password_confirmation: '123')
    @suzie = User.create!(name: 'Suzie', email: 'suzieq@gmail.com', password: '123', password_confirmation: '123')
    @pu1 = PartyUser.create(user: @kevin, party: party, status: :hosting)
    @pu2 = PartyUser.create(user: @eldridge, party: party, status: :invited)
    @pu3 = PartyUser.create(user: @eldridge, party: party_2, status: :invited)
    @pu4 = PartyUser.create(user: @suzie, party: party_2, status: :hosting)

    visit login_path
    fill_in :email, with: 'kevin@gmail.com'
    fill_in :password, with: '123'
    click_on 'Log In'
  end

  it 'should have the users name', :vcr do
    visit dashboard_path

    expect(page).to have_content("#{@kevin.name}'s Dashboard")
    expect(page).to_not have_content("#{@eldridge.name}'s Dashboard")
  end

  it 'has a button to discover movies', :vcr do
    visit dashboard_path

    click_on 'Discover Movies'

    expect(current_path).to eq(discover_index_path)
  end

  it 'links to show page from landing page', :vcr do
    visit root_path

    click_link "#{@kevin.name} | #{@kevin.email}"

    expect(current_path).to eq(dashboard_path)
  end

  it 'has the parties the user is hosting/invited to', :vcr do
    visit dashboard_path

    expect(page).to have_content('The Hobbit: An Unexpected Journey')
    expect(page).to_not have_content('Meet the Mobsters')
  end
end
