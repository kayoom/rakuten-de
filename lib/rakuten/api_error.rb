require 'active_support/core_ext/class'

module Rakuten
  class ApiError < Error
    class_attribute :code
    self.code = 0

    attr_reader :help

    def initialize message, help = nil
      @help = help
      super message
    end

    class << self
      def [] code
        code = code.to_i
        return self if code == 0

        @errors_by_code ||= Hash.new do |hash, key|
          error_class = Class.new(self).tap { |c| c.code = key }
          const_set "E#{key}", error_class
          hash[key] = error_class
        end

        @errors_by_code[code]
      end
    end
  end
end
