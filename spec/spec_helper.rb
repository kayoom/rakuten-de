require 'rubygems'
require 'bundler/setup'

require 'rakuten-de'

require 'rspec'
require 'rspec/mocks'
require 'rspec/mocks/standalone'
require 'webmock/rspec'

module Helpers
  def sandbox_key
    '123456789a123456789a123456789a12'
  end
end

RSpec.configure do |config|
  config.include Helpers
end
