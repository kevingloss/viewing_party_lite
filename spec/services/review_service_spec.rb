# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Review Service' do
  describe 'class methods' do
    it 'returns the review author and information', :vcr do
      service = ReviewService.author_name(49_051)
      expect(service).to be_a(Array)
      expect(service[0][:author_details][:name]).to eq('Andres Gomez')
    end
  end
end
