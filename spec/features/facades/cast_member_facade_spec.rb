# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CastMemberFacade do
  it 'creates a collection of actors/actresses', :vcr do
    cast_members = CastMemberFacade.starring(49_051)

    expect(cast_members.first).to be_an_instance_of(CastMember)
    expect(cast_members.count).to be <= 10
  end
end
