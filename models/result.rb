# frozen_string_literal: true

# Computes the search result for a query against a group of page
# classifications.
class Result
  def initialize(query, classifications)
    @query = query
    @classifications = classifications
    @relationships = complile_relationships
  end

  def to_s
    output = "Q#{@query.number}: "
    @relationships.each do |relationship|
      output << "P#{relationship.classification.number} "
    end
    output.strip + "\n"
  end

  private

  # Creates relationships for a given query against a group of classifications.
  # Will disgard any relationships that have a score of 0.
  def complile_relationships
    relationships = []
    @classifications.each do |classification|
      relationship = Relationship.new(@query, classification)
      relationships << relationship unless relationship.score.zero?
    end
    relationships.sort
  end
end
