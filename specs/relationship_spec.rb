require_relative '../models/relationship'

RSpec.describe Relationship do
  it 'creates a new Relationship and is able to be access properties' do
    query = Notation.new(1, ['ford', 'car'])
    classification = Notation.new(1, ['ford', 'car', 'review'])
    relationship = Relationship.new(query, classification)

    expect(relationship.score).to eq(113)
    expect(relationship.classification).to eq(classification)
  end

  it 'sorts relations by score and then by page number' do
    query = Notation.new(1, ['ford', 'car'])

    classification = Notation.new(1, ['ford', 'car', 'review'])
    relationship1 = Relationship.new(query, classification)

    classification = Notation.new(2, ['ford', 'chicken', 'review'])
    relationship2 = Relationship.new(query, classification)

    classification = Notation.new(3, ['ford', 'chicken', 'review'])
    relationship3 = Relationship.new(query, classification)

    relationships = [relationship2, relationship3, relationship1]

    relationships_answer = [relationship1, relationship2, relationship3]
    expect(relationships.sort).to eq(relationships_answer)
  end
end
