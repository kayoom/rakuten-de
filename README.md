rakuten-de
==========
[![Build Status](https://secure.travis-ci.org/kayoom/rakuten-de.png)](http://travis-ci.org/kayoom/rakuten-de)
[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/kayoom/rakuten-de)

This is a simple gem to access the _rakuten.de_ REST-Api. You can find
the documentation for the Api itself
[here](http://webservice.rakuten.de/documentation/overview).

Requirements:
-------------

* Ruby 1.9.2 or 1.9.3, or Rubinius in 1.9 mode, or JRuby in 1.9 mode
* rest-client gem
* activesupport gem >= 3.1.0

Getting Started
-----------

Install _rakuten-de_ with `gem install rakuten-de` or add it to your
_Gemfile_: `gem 'rakuten-de'`. Fire up _IRB_, a rails console (`rails
c`) or a simple test file and do:

    require 'rakuten-de'
    client = Rakuten::Client.new '123456789a123456789a123456789a12' # Sandbox API-Key, replace with your API-Key for production use

    client.get :misc, :get_key_info
    # => {"key"=>{"active"=>"1", "calls_today"=>"20", "last_call_datetimestamp"=>"2010-01-01 20:15:00", "daily_calls_limit"=>"10000", "permissions"=>{"products"=>"write", "orders"=>"read", "categories"=>"forbidden"}}}
    
    # or via post
    client.post :misc, :get_key_info
    # => {"key"=>{"active"=>"1", "calls_today"=>"20", "last_call_datetimestamp"=>"2010-01-01 20:15:00", "daily_calls_limit"=>"10000", "permissions"=>{"products"=>"write", "orders"=>"read", "categories"=>"forbidden"}}}

You can find a list of possible methods, parameters and response formats [here](http://webservice.rakuten.de/documentation/overview).

Handling Errors
---------------

_rakuten-de_ will raise the first returned error if the API response
indicates an error. You can rescue generic API-Errors or only specified.

    begin
      client = Rakuten::Client.new 'some_bogus_key'
      client.get :misc, :get_key_info

    rescue Rakuten::ApiError[15] => e  # 15 is the error code for invalid key
      puts "Wrong key"
    rescue Rakuten::ApiError # catch any other errors
      # ...
    end

Changelog
---------

* 0.0.2:
  * Using larger timeouts
  * Subclasses of ApiError (e.g. ApiError[15]) now have a proper
    class.name (-> ApiError::E15)
* 0.0.1:
  * initial release

More to come ...
----------------

Disclaimer
----------
Please note that "Rakuten" is a registered trademark of "Rakuten
Deutschland GmbH". We are not associated with Rakuten Deutschland GmbH
and provide this gem under a MIT license.
