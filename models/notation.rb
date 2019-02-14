# frozen_string_literal: true

# Stores the identification number and an array of key word items for either a
# query or a page classification.
class Notation
  def initialize(number, items)
    @number = number
    @items = items
  end

  attr_accessor :number, :items
end
