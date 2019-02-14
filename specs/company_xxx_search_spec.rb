# frozen_string_literal: true

require_relative '../company_xxx_search.rb'
require 'rack/test'

RSpec.describe CompanyXXXSearch do
  include Rack::Test::Methods

  def app
    CompanyXXXSearch.new
  end

  it 'outputs results' do
    get '/', input: ''

    expect(last_response.body).to include('')

    spec_input = File.new('specs/fixtures/spec_input.txt')
    spec_output = File.new('specs/fixtures/spec_output.txt')

    get '/', input: spec_input.read

    expect(last_response.body).to eq(spec_output.read)
  end
end
