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
    output.strip
  end

  private

  def complile_relationships
    relationships = []
    @classifications.each do |classification|
      relationship = Relationship.new(@query, classification)
      relationships << relationship unless relationship.score.zero?
    end
    relationships.sort
  end
end
