# frozen_string_literal: true

require 'rack/test'
require 'rspec'

ENV['RACK_ENV'] = 'test'

# A helper module for rspec tests
module RSpecMixin
  include Rack::Test::Methods

  def app
    described_class
  end
end

RSpec.configure do |c|
  c.include RSpecMixin
end
