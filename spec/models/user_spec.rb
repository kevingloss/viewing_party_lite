require 'rails_helper'

RSpec.describe User do
  before :each do
    @eldridge = User.create!(name: 'Eldridge', email: 'eldridge@gmail.com')
    @kevin = User.create!(name: 'Kevin', email: 'kevin@gmail.com')
    @suzie = User.create!(name: 'Suzie', email: 'suzieq@gmail.com')
  end

  describe 'relationships' do
    it {should have_many(:party_users)}
    it {should have_many(:parties).through(:party_users)}
  end

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :email}
    it {should validate_uniqueness_of(:email)}
  end

  describe '#methods' do 
    it 'except_user' do 
      users = User.except_user(@kevin.id)

      expect(users).to eq([@eldridge, @suzie])
    end
  end
end
