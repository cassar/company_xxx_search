# frozen_string_literal: true

require_relative '../../models/search_processor'

RSpec.describe SearchProcessor do
  it 'creates a new search processor and outputs correctly' do
    input = File.new('specs/fixtures/processor_input.txt').read

    search_processor = SearchProcessor.new(input)

    output = File.new('specs/fixtures/processor_output.txt').read

    expect(search_processor.to_s).to eq(output)
  end
end
