class NotationProcessor
  def initialize(queries, classifications)
    @queries = queries
    @classifications = classifications
    @results = process_notations
  end

  def to_s
    output = ''
    @results.each { |result| output << result.to_s }
    output
  end

  private

  # Creates a result object or each query notation against the group
  # classification notations.
  def process_notations
    results = []
    @queries.each { |query| results << Result.new(query, @classifications) }
    results
  end
end
