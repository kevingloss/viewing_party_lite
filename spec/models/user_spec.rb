# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  before :each do
    @eldridge = User.create!(name: 'Eldridge', email: 'eldridge@gmail.com', password: '123', password_confirmation: '123')
    @kevin = User.create!(name: 'Kevin', email: 'kevin@gmail.com', password: '123', password_confirmation: '123')
    @suzie = User.create!(name: 'Suzie', email: 'suzieq@gmail.com', password: '123', password_confirmation: '123')
  end

  describe 'relationships' do
    it { should have_many(:party_users) }
    it { should have_many(:parties).through(:party_users) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of(:email) }
    it { should have_secure_password }
    it { should validate_presence_of :password_digest}

    it 'does not show the users password' do 
      expect(@kevin).to_not have_attribute(:password)
      expect(@kevin.password_digest).to_not eq('123')
    end
  end

  describe '#methods' do
    it 'except_user' do
      users = User.except_user(@kevin.id)

      expect(users).to eq([@eldridge, @suzie])
    end
  end
end
