# Configure Rails Environment
ENV['RAILS_ENV'] = 'test'

# Start SimpleCov
require 'simplecov'
unless ENV['NO_COVERAGE']
  SimpleCov.start('rails') do
    add_filter 'lib/shopify_app_whitelist/version.rb'
  end
end

require File.expand_path('../../test/dummy/config/environment.rb',  __FILE__)
require 'rails/test_help'

Minitest.backtrace_filter = Minitest::BacktraceFilter.new
