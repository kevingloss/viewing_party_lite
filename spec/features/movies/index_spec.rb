require 'rails_helper'

RSpec.describe 'Movies index' do
  before :each do
    @eldridge = User.create!(name: 'Eldridge', email: 'eldridge@gmail.com')
    @kevin = User.create!(name: 'Kevin', email: 'kevin@gmail.com')
    @suzie = User.create!(name: 'Suzie', email: 'suzieq@gmail.com')
  end

  it 'has link to discover path' do

    visit user_discover_index_path(@eldridge)

    click_button("Top Rated Movies")

    expect(current_path).to eq(user_movies_path(@eldridge))
  end
end
