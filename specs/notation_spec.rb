require_relative '../models/notation'

RSpec.describe Notation do
  it 'creates a new notation and is able to be accessed' do
    notation = Notation.new(1, ['ford', 'car'])

    expect(notation.number).to eq(1)
    expect(notation.items).to eq(['ford', 'car'])
  end
end
