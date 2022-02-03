require 'rails_helper'

RSpec.describe CastMemberFacade do

  it 'creates a collection of actors/actresses', :vcr do
    cast_members = CastMemberFacade.starring(49051)
    
    expect(cast_members.first).to be_an_instance_of(CastMember)
    expect(movie.count).to be <= 10
  end
end