# frozen_string_literal: true

require 'sinatra'
require 'sinatra/base'
require_relative 'models/notation_parser'
require_relative 'models/notation_processor'

# A single page application to review results.
class CompanyXXXSearch < Sinatra::Base
  get '/' do
    NotationProcessor.new(params[:input]).to_s
  end
end
