# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PartyUser do
  before :each do
    @party = Party.create(duration: 180, date: '2022-02-03', start_time: '21:47', movie_id: 49_051)
    @party_2 = Party.create(duration: 120, date: '2022-02-14', start_time: '19:47', movie_id: 90)
    @eldridge = User.create!(name: 'Eldridge', email: 'eldridge@gmail.com', password: '123', password_confirmation: '123')
    @kevin = User.create!(name: 'Kevin', email: 'kevin@gmail.com', password: '123', password_confirmation: '123')
    @suzie = User.create!(name: 'Suzie', email: 'suzieq@gmail.com', password: '123', password_confirmation: '123')
    @pu1 = PartyUser.create(user: @kevin, party: @party, status: :hosting)
    @pu2 = PartyUser.create(user: @eldridge, party: @party, status: :invited)
    @pu3 = PartyUser.create(user: @eldridge, party: @party_2, status: :invited)
    @pu4 = PartyUser.create(user: @suzie, party: @party_2, status: :hosting)
  end

  describe 'relationships' do
    it { should belong_to(:party) }
    it { should belong_to(:user) }
  end

  describe 'class methods' do
    it 'finds all parties for a user', :vcr do
      expect(PartyUser.attending(@eldridge)).to eq([@pu2, @pu3])
    end
  end

  describe 'instance methods' do
    it 'finds the movie for a user party', :vcr do
      expect(@pu3.party_movie.title).to eq('Beverly Hills Cop')
    end
  end
end
