# Configure Rails Environment
ENV['RAILS_ENV'] = 'test'

# Start SimpleCov
require 'simplecov'
SimpleCov.start('rails') do
  add_filter 'lib/shopify_app_whitelist/version.rb'
end

# Start Codecov
if ENV['CI'] == 'true'
  require 'codecov'
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end

require File.expand_path('../../test/dummy/config/environment.rb',  __FILE__)
require 'rails/test_help'

Minitest.backtrace_filter = Minitest::BacktraceFilter.new
