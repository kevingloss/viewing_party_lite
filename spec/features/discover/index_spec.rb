require 'rails_helper'

describe 'Discover Page' do
    before :each do
        @eldridge = User.create!(name: 'Eldridge', email: 'eldridge@gmail.com')
        @kevin = User.create!(name: 'Kevin', email: 'kevin@gmail.com')
        @suzie = User.create!(name: 'Suzie', email: 'suzieq@gmail.com')
    end

    it 'should list out all users' do
        visit user_discover_index_path(@kevin)

        expect(page).to have_content("Viewing Party Lite")
        expect(page).to have_content("Discover Movies")
    end

    it 'has link from top rated movies page' do

      visit user_movies_path(@eldridge)

      click_button('Discover Page')

      expect(current_path).to eq(user_discover_index_path(@eldridge))
    end
end
