# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Show Page' do
  before :each do
    party = Party.create(duration: 180, date: '2022-02-03', start_time: '21:47', movie_id: 49_051)
    party_2 = Party.create(duration: 120, date: '2022-02-14', start_time: '19:47', movie_id: 57_021)
    @eldridge = User.create!(name: 'Eldridge', email: 'eldridge@gmail.com')
    @kevin = User.create!(name: 'Kevin', email: 'kevin@gmail.com')
    @suzie = User.create!(name: 'Suzie', email: 'suzieq@gmail.com')
    @pu1 = PartyUser.create(user: @kevin, party: party, status: :hosting)
    @pu2 = PartyUser.create(user: @eldridge, party: party, status: :invited)
    @pu3 = PartyUser.create(user: @eldridge, party: party_2, status: :invited)
    @pu4 = PartyUser.create(user: @suzie, party: party_2, status: :hosting)
  end

  it 'should have the users name', :vcr do
    visit user_path(@eldridge)

    expect(page).to have_content("#{@eldridge.name}'s Dashboard")
    expect(page).to_not have_content("#{@kevin.name}'s Dashboard")
  end

  it 'has a button to discover movies', :vcr do
    visit user_path(@eldridge)

    click_on 'Discover Movies'

    expect(current_path).to eq(user_discover_index_path(@eldridge))
  end

  it 'links to show page from landing page', :vcr do
    visit root_path

    click_link "#{@eldridge.name} | #{@eldridge.email}"

    expect(current_path).to eq(user_path(@eldridge))
  end

  it 'has the parties the user is hosting/invited to', :vcr do
    visit user_path(@eldridge)

    expect(page).to have_content('The Hobbit: An Unexpected Journey')
    expect(page).to have_content('Meet the Mobsters')
  end
end
