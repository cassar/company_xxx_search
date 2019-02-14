# frozen_string_literal: true

require_relative '../../models/notation_processor'

RSpec.describe NotationProcessor do
  it 'creates an new notation processor and outputs the correct output' do
    queries = []
    queries << Notation.new(1, %w[ford car])
    queries << Notation.new(2, %w[ford chicken car])
    queries << Notation.new(3, %w[dog chicken car])

    classifications = []
    classifications << Notation.new(1, %w[ford chicken review])
    classifications << Notation.new(2, %w[ford car review])
    classifications << Notation.new(3, %w[ford chicken review])

    notation_processor = NotationProcessor.new(queries, classifications)

    output = File.new('specs/fixtures/processor_output.txt').read

    expect(notation_processor.to_s).to eq(output)
  end
end
