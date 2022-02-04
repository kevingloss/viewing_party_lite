# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CastMember do
  it 'has attributes' do
    data = {
      name: 'Ian McKellen',
      character: 'Gandalf'
    }

    actor = CastMember.new(data)

    expect(actor).to be_a(CastMember)
    expect(actor.name).to eq('Ian McKellen')
    expect(actor.character).to eq('Gandalf')
  end
end
