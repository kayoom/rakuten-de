require 'active_support/core_ext/array'

module Rakuten
  class Request
    URL = "http://webservice.rakuten.de/merchants"
    FORMAT = "json"

    attr_reader :group, :method, :version, :params

    def initialize *args
      @params = args.extract_options!
      @group, @method, @version = args
    end

    def url
      @url ||= [URL, group, method, version].compact * '/'
    end
  end
end
