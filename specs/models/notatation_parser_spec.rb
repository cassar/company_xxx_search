# frozen_string_literal: true

require_relative '../../models/notation_parser'

RSpec.describe NotationParser do
  it 'creates an new notation parser and outputs the correct output' do
    queries = []
    queries << Notation.new(1, %w[ford car])
    queries << Notation.new(2, %w[ford chicken car])
    queries << Notation.new(3, %w[dog chicken car])

    classifications = []
    classifications << Notation.new(1, %w[ford chicken review])
    classifications << Notation.new(2, %w[ford car review])
    classifications << Notation.new(3, %w[ford chicken review])

    input = File.new('specs/fixtures/parser_input.txt').read

    notation_parser = NotationParser.new(input)

    queries.each_with_index do |query, index|
      parse_query = notation_parser.queries[index]
      expect(parse_query.number).to eq(query.number)
      expect(parse_query.items).to eq(query.items)
    end

    classifications.each_with_index do |classification, index|
      parse_classification = notation_parser.classifications[index]
      expect(parse_classification.number).to eq(classification.number)
      expect(parse_classification.items).to eq(classification.items)
    end

    lower_id = input + "q ford chicken review\n"
    expect { NotationParser.new(lower_id) }.to raise_error(StandardError)

    wrong_id = input + "X ford chicken review\n"
    expect { NotationParser.new(wrong_id) }.to raise_error(StandardError)

    too_few_keys = input + "P\n"
    expect { NotationParser.new(too_few_keys) }.to raise_error(StandardError)

    too_many_keys = input + 'P 1 2 3 4 5 6 7 8 9'
    expect { NotationParser.new(too_many_keys) }.to raise_error(StandardError)
  end
end
