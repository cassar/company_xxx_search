# frozen_string_literal: true

require 'sinatra'
require 'haml'
require_relative 'models/search_processor'

# A single page application to review results.
class CompanyXXXSearch < Sinatra::Application
  get '/' do
    unless params[:input].nil?
      begin
        @output = SearchProcessor.new(params[:input]).to_s
      rescue StandardError => exception
        @error = exception.message
      end
    end
    haml :index, format: :html5
  end
end
