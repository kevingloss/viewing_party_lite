require 'rails_helper'

describe 'Login Page' do
  before :each do
    @eldridge = User.create!(name: 'Eldridge', email: 'eldridge@gmail.com', password: '123', password_confirmation: '123')
    @kevin = User.create!(name: 'Kevin', email: 'kevin@gmail.com', password: '123', password_confirmation: '123')
    @suzie = User.create!(name: 'Suzie', email: 'suzieq@gmail.com', password: '123', password_confirmation: '123')
  end

  it "can log in with valid credentials" do
    visit root_path

    click_on "Log In"
    
    expect(current_path).to eq(login_path)

    fill_in :email, with: @kevin.email
    fill_in :password, with: @kevin.password

    click_on "Log In"

    expect(current_path).to eq(dashboard_path)

    expect(page).to have_content("Welcome, #{@kevin.name}")
  end

  it "cannot log in with bad credentials" do
    visit login_path
  
    fill_in :email, with: @kevin.email
    fill_in :password, with: "incorrect password"
  
    click_on "Log In"
  
    expect(current_path).to eq(login_path)
  
    expect(page).to have_content("Sorry, your credentials are bad.")
  end

  it 'cannot go to dashboard without logging in' do 
    visit root_path
    visit dashboard_path

    expect(current_path).to eq(root_path)
    expect(page).to have_content('you must be logged in')
  end
end