# frozen_string_literal: true

require_relative '../../models/result'

RSpec.describe Result do
  it 'creates a new result and outputs the correct output' do
    query = Notation.new(1, %w[ford car])
    classifications = []
    classifications << Notation.new(1, %w[ford chicken review])
    classifications << Notation.new(2, %w[ford car review])
    classifications << Notation.new(3, %w[ford chicken review])
    classifications << Notation.new(4, %w[ford chicken review])
    classifications << Notation.new(5, %w[ford chicken review])
    classifications << Notation.new(6, %w[ford chicken review])

    result = Result.new(query, classifications)

    expect(result.to_s).to eq("Q1: P2 P1 P3 P4 P5\n")
  end
end
