# frozen_string_literal: true

require_relative '../../models/notation_processor'

RSpec.describe NotationProcessor do
  it 'creates a new notation processor and outputs correctly' do
    input = File.new('specs/fixtures/processor_input.txt').read

    notation_processor = NotationProcessor.new(input)

    output = File.new('specs/fixtures/processor_output.txt').read

    expect(notation_processor.to_s).to eq(output)
  end
end
