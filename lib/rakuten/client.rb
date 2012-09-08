module Rakuten
  class Client
    attr_reader :api_key

    def initialize api_key
      @api_key = api_key
    end

    def get group, method, params = {}
      Response.new(request_for(group, method, params).get).result
    end

    def post group, method, params = {}
      Response.new(request_for(group, method, params).post).result
    end

    protected
    def request_for group, method, params
      Request.new group, method, params.merge(key: @api_key)
    end
  end
end
