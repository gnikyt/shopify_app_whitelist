# Configure Rails Environment
ENV['RAILS_ENV'] = 'test'

# Start SimpleCov
require 'simplecov'
SimpleCov.start('rails') unless ENV['NO_COVERAGE']

require File.expand_path('../../test/dummy/config/environment.rb',  __FILE__)
require 'rails/test_help'

Minitest.backtrace_filter = Minitest::BacktraceFilter.new
