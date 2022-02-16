# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'New User' do
  before :each do
    @eldridge = User.create!(name: 'Eldridge', email: 'eldridge@gmail.com', password: '123', password_confirmation: '123')
    @kevin = User.create!(name: 'Kevin', email: 'kevin@gmail.com', password: '123', password_confirmation: '123')
    @suzie = User.create!(name: 'Suzie', email: 'suzieq@gmail.com', password: '123', password_confirmation: '123')
  end

  it 'should be have a button from the landing page' do
    visit root_path

    click_link 'Create New User'

    expect(current_path).to eq(new_user_path)
  end

  it 'can register a new user with valid input' do
    visit new_user_path

    fill_in(:user_name, with: 'John')
    fill_in(:user_email, with: 'john@gmail.com')
    fill_in(:user_password, with: 'pw123')
    fill_in(:user_password_confirmation, with: 'pw123')
    click_button 'Create User'

    user = User.find_by(name: 'John')

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content(user.name)
  end

  describe 'sad paths' do 
    it 'has a sad path for invalid email' do
      visit new_user_path
  
      fill_in(:user_name, with: 'John')
      fill_in(:user_email, with: 'johnnyboy')
      fill_in(:user_password, with: 'pw123')
      fill_in(:user_password_confirmation, with: 'pw123')
      click_button 'Create User'
  
      user = User.find_by(name: 'John')
  
      expect(current_path).to eq(new_user_path)
      expect(page).to have_content(['Email is invalid'])
    end

    it 'has a sad path for non unique email' do
      visit new_user_path
  
      fill_in(:user_name, with: 'John')
      fill_in(:user_email, with: 'kevin@gmail.com')
      fill_in(:user_password, with: 'pw123')
      fill_in(:user_password_confirmation, with: 'pw123')
      click_button 'Create User'
  
      user = User.find_by(name: 'John')
  
      expect(current_path).to eq(new_user_path)
      expect(page).to have_content(["Email has already been taken"])
    end

    it 'has a sad path for matching passwords' do
      visit new_user_path
  
      fill_in(:user_name, with: 'John')
      fill_in(:user_email, with: 'jonnyboy@gmail.com')
      fill_in(:user_password, with: 'pw123')
      fill_in(:user_password_confirmation, with: 'pw12')
      click_button 'Create User'
  
      user = User.find_by(name: 'John')
  
      expect(current_path).to eq(new_user_path)
      expect(page).to have_content(["Password confirmation doesn't match Password"])
    end    

    it 'has a sad path for the name being blank' do
      visit new_user_path
  
      fill_in(:user_name, with: '')
      fill_in(:user_email, with: 'jonnyboy@gmail.com')
      fill_in(:user_password, with: 'pw123')
      fill_in(:user_password_confirmation, with: 'pw123')
      click_button 'Create User'
  
      user = User.find_by(name: 'John')
  
      expect(current_path).to eq(new_user_path)
      expect(page).to have_content(["Name can't be blank"])
    end

    it 'has a sad path for the name missing' do
      visit new_user_path
  
      fill_in(:user_email, with: 'jonnyboy@gmail.com')
      fill_in(:user_password, with: 'pw123')
      fill_in(:user_password_confirmation, with: 'pw123')
      click_button 'Create User'
  
      user = User.find_by(name: 'John')
  
      expect(current_path).to eq(new_user_path)
      expect(page).to have_content(["Name can't be blank"])
    end
  end
  
  it 'has a link to the landing page' do
    visit new_user_path

    click_link 'Home'

    expect(current_path).to eq(root_path)
  end
end
