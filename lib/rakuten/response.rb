require 'active_support/json'

module Rakuten
  class Response
    JSON = ActiveSupport::JSON
    attr_reader :raw

    def initialize body
      @raw = JSON.decode body
    end

    def success?
      status_code != -1
    end

    def failed?
      status_code == -1
    end

    def empty?
      status_code == 0
    end

    def errors
      @errors ||= _errors.map do |error|
        Rakuten::ApiError[error['code']].new *error.values_at('message', 'help')
      end
    end

    protected
    def status_code
      fetch :result, :success, -1
    end

    def _errors
      fetch :result, :errors, :error, []
    end

    def fetch *keys, default
      keys[0...-1].inject(@raw) do |hash, key|
        hash.fetch(key.to_s, {})
      end.fetch(keys.last.to_s, default)
    end
  end
end
