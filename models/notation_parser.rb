# frozen_string_literal: true

# Parses a given string of text into two groups of Notation instances (queries
# and classifications).
# Will raise StandardError exception if input entred incorrectly.
class NotationParser
  def initialize(input)
    @queries = []
    @classifications = []
    parse(input)
  end

  KEYWORD_RANGE = (1..8).freeze

  attr_accessor :queries, :classifications

  private

  def parse(input)
    input.split("\n").each do |line|
      sort_notation_line(line[0], line.downcase.split.drop(1))
    end
  end

  def sort_notation_line(id, key_words)
    case id
    when 'P'
      add_notation_to_group(@classifications, key_words)
    when 'Q'
      add_notation_to_group(@queries, key_words)
    else
      raise StandardError, "Unknown identifer '#{id}' found"
    end
  end

  def add_notation_to_group(group, key_words)
    if KEYWORD_RANGE.include? key_words.length
      group << Notation.new(group.length + 1, key_words)
    else
      min = KEYWORD_RANGE.min
      max = KEYWORD_RANGE.max
      raise StandardError, "Key word range must be between #{min} and #{max}"
    end
  end
end
