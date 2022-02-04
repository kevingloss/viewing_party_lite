require 'rails_helper'

RSpec.describe 'New Party' do
  before :each do
    @eldridge = User.create!(name: 'Eldridge', email: 'eldridge@gmail.com')
    @kevin = User.create!(name: 'Kevin', email: 'kevin@gmail.com')
    @suzie = User.create!(name: 'Suzie', email: 'suzieq@gmail.com')
  end

  it 'has a link back to the discover page', :vcr do 
    visit new_user_movie_party_path(@kevin, 49051)

    click_button 'Discover Page'

    expect(current_path).to eq(user_discover_index_path(@kevin))
  end

  it 'can create a new party', :vcr do 
    visit new_user_movie_party_path(@kevin, 49051)

    fill_in(:duration, with: 180)
    fill_in(:date, with: "2022-02-03")
    fill_in(:start_time, with: "21:47")

    check(@eldridge.name)

    click_on "Create Party"

    expect(current_path).to eq(user_path(@kevin))
  end

  it 'will redirect to new page on failed creation', :vcr do 
    visit new_user_movie_party_path(@kevin, 49051)

    fill_in(:duration, with: 10)
    fill_in(:date, with: "2022-02-14")
    fill_in(:start_time, with: "21:47")

    check(@eldridge.name)

    click_on "Create Party"
    
    expect(current_path).to eq(new_user_movie_party_path(@kevin, 49051))
    expect(page).to have_content('Please check the duration is longer than the movie runtime.')
  end
end