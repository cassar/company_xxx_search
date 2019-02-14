# frozen_string_literal: true

# Computes the weighted score between a query and a given page classification.
class Relationship
  include Comparable

  def initialize(query, classification)
    @query = query
    @classification = classification
    @score = compute_score
  end

  # The maximum number of key words.
  N = 8

  attr_accessor :score, :classification

  # Will sort to present larger number scores first. Where two score are equal
  # will put the relationship with the smaller classification/page number first.
  def <=>(other)
    compare = other.score <=> score
    return compare unless compare.zero?

    classification.number <=> other.classification.number
  end

  private

  # Computes the score of a relationship as the sum of the products of the
  # weighs of a match in equivalent elements.
  def compute_score
    products = []
    @query.items.each_with_index do |element, index|
      products << (weight(index) * weight(@classification.items.index(element)))
    end
    products.sum
  end

  # Returns the weight of an element at a given index.
  def weight(index)
    index.nil? ? 0 : (N - index)
  end
end
