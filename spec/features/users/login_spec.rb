require 'rails_helper'

describe 'Discover Page' do
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

    expect(current_path).to eq(user_path(@kevin))

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
end