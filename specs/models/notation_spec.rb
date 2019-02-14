# frozen_string_literal: true

require_relative '../../models/notation'

RSpec.describe Notation do
  it 'creates a new notation and is able to be accessed' do
    notation = Notation.new(1, %w[ford car])

    expect(notation.number).to eq(1)
    expect(notation.items).to eq(%w[ford car])
  end
end
