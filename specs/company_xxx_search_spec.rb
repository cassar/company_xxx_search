# frozen_string_literal: true

require_relative 'spec_helper.rb'
require_relative '../company_xxx_search.rb'

RSpec.describe CompanyXXXSearch do
  it 'should get home' do
    get '/'

    expect(last_response).to be_ok
  end
end
