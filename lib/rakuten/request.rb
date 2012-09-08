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
      RestClient.get url, params: params
    end

    def post
      RestClient.post url, params
    end

    def params
      @params.merge format: FORMAT
    end
  end
end
