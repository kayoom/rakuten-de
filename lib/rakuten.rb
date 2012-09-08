require 'rakuten/version'

require 'active_support/dependencies/autoload'

module Rakuten
  extend ActiveSupport::Autoload

  autoload :Client
  autoload :Request
  autoload :Response
  autoload :Error
  autoload :ApiError
end
