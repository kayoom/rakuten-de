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

  def stub_response name
    File.read File.join(File.dirname(__FILE__), 'responses', "#{name}.json")
  end

  def stub_get group, name, response
    stub_http_request(:get, "webservice.rakuten.de/merchants/#{group}/#{name}").
      with(query: hash_including( key: sandbox_key, format: "json")).
      to_return(body: stub_response(response), status: 200)
  end

  def stub_post group, name, response
    stub_request(:post, "webservice.rakuten.de/merchants/#{group}/#{name}").
      with(body: hash_including( key: sandbox_key, format: "json")).
      to_return(body: stub_response(response), status: 200)
  end
end

RSpec.configure do |config|
  config.include Helpers
end
