require_relative '../models/notation_processor'

RSpec.describe NotationProcessor do
  it 'creates an new notation processor and outputs the correct output' do

    queries = []
    queries << Notation.new(1, ['ford', 'car'])
    queries << Notation.new(2, ['ford', 'chicken', 'car'])
    queries << Notation.new(3, ['dog', 'chicken', 'car'])

    classifications = []
    classifications << Notation.new(1, ['ford', 'chicken', 'review'])
    classifications << Notation.new(2, ['ford', 'car', 'review'])
    classifications << Notation.new(3, ['ford', 'chicken', 'review'])

    notation_processor = NotationProcessor.new(queries, classifications)

    answer = ''
    answer << "Q1: P2 P1 P3\n"
    answer << "Q2: P1 P3 P2\n"
    answer << "Q3: P1 P3 P2\n"

    expect(notation_processor.to_s).to eq(answer)
  end
end
