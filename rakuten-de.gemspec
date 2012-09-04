# -*- encoding: utf-8 -*-

$:.push File.expand_path("../lib", __FILE__)
require "rakuten/version"

Gem::Specification.new do |s|
  s.name        = "rakuten-de"
  s.version     = Rakuten::VERSION
  s.platform    = Gem::Platform::RUBY
  s.date        = Time.now.strftime("%Y-%m-%d")
  s.authors     = ["Marian Theisen"]
  s.email       = 'dev@kayoom.com'
  s.summary     = "Rakuten API client"
  s.homepage    = "http://github.com/kayoom/rakuten-de"
  s.description = "Rakuten API client"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "activesupport", ">= 3.1.0"
  s.add_dependency "rest-client", "~> 1.6.7"

  s.add_development_dependency "yard"
  s.add_development_dependency "rspec"
  s.add_development_dependency 'rspec-mocks'
  s.add_development_dependency 'rspec-expectations'
  s.add_development_dependency "bundler"
  s.add_development_dependency "webmock"
end
