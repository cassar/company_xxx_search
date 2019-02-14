# frozen_string_literal: true

# Parses a given string of text into two groups of Notation instances (queries
# and classifications).
# Will raise exception if input entred incorrectly.
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
    input.split("\n").each { |line| sort_notation_line(line.downcase.split) }
  end

  def sort_notation_line(notation_array)
    case notation_array.first
    when 'p'
      add_notation_to_group(@classifications, notation_array)
    when 'q'
      add_notation_to_group(@queries, notation_array)
    else
      raise StandardError, "Unknown identifer '#{notation_array.first}' found"
    end
  end

  def add_notation_to_group(group, notation_array)
    key_words = notation_array.drop(1)
    if KEYWORD_RANGE.include? key_words.length
      group << Notation.new(group.length + 1, key_words)
    else
      min = KEYWORD_RANGE.min
      max = KEYWORD_RANGE.max
      raise StandardError, "Key word range must be between #{min} and #{max}"
    end
  end
end
