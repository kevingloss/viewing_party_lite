# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Cast Member Service' do
  describe 'class methods' do
    it 'returns the cast members', :vcr do
      cast_members = CastMemberService.starring(49_051)

      expect(cast_members.first).to be_a(Hash)
      expect(cast_members.count).to eq(10)
      expect(cast_members.first).to have_key(:name)
      expect(cast_members.first).to have_key(:character)
    end
  end
end
