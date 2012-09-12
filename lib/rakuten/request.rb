require 'active_support/core_ext/array'
require 'rest_client'

module Rakuten
  class Request
    URL = "http://webservice.rakuten.de/merchants"
    FORMAT = "json"

    attr_reader :group, :method, :version

    def initialize *args
      @params = args.extract_options!
      @group, @method, @version = args.map(&:to_s)

      @method = @method.camelize(:lower)
    end

    def url
      @url ||= [URL, group, method, version].compact * '/'
    end

    def get
      resource.get params: params
    end

    def post
      resource.post params
    end

    def resource
      @resource ||= RestClient::Resource.new(url, timeout: -1, open_timeout: 120)
    end

    def params
      @params.merge format: FORMAT
    end
  end
end
