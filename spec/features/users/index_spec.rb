# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Landing Page' do
  before :each do
    @eldridge = User.create!(name: 'Eldridge', email: 'eldridge@gmail.com', password: '123', password_confirmation: '123')
    @kevin = User.create!(name: 'Kevin', email: 'kevin@gmail.com', password: '123', password_confirmation: '123')
    @suzie = User.create!(name: 'Suzie', email: 'suzieq@gmail.com', password: '123', password_confirmation: '123')

    visit login_path
    fill_in :email, with: 'kevin@gmail.com'
    fill_in :password, with: '123'
    click_on 'Log In'
  end

  it 'should list out all users' do
    visit root_path

    expect(page).to have_content(@eldridge.name)
    expect(page).to have_content(@kevin.name)
    expect(page).to have_content(@suzie.name)
  end

  it 'has a link to the landing page' do
    visit root_path

    click_link 'Home'

    expect(current_path).to eq(root_path)
  end

  it 'has a link to logout' do 
    visit root_path

    click_link 'Logout'

    expect(page).to have_content('Log In')
  end

  it 'does not show users if not logged in' do 
    visit root_path

    click_link 'Logout'

    expect(page).to_not have_content(@eldridge.name)
    expect(page).to_not have_content(@kevin.name)
    expect(page).to_not have_content(@suzie.name)
  end
end
