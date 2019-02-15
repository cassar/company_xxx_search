# frozen_string_literal: true

require 'sinatra'
require 'sinatra/base'
require 'Haml'
require_relative 'models/search_processor'

# A single page application to review results.
class CompanyXXXSearch < Sinatra::Base
  get '/' do
    if params[:input].nil?
      @output = 'Input query and page classification information above.'
    else
      begin
        @output = SearchProcessor.new(params[:input]).to_s
      rescue StandardError => exception
        @output = exception.message
      end
    end
    haml :index, format: :html5
  end
end
