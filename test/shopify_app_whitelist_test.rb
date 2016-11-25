require 'test_helper'

class ShopifyAppWhitelistTest < ActiveSupport::TestCase
  test 'is working' do
    assert_equal Module, ShopifyAppWhitelist.class
  end

  test 'adds configuration options to shopify_app' do
    vars = ShopifyApp.configuration.instance_variables

    assert vars.include?(:@whitelist)
    assert vars.include?(:@whitelist_redirect)
  end

  test 'adds concern to application controller' do
    assert ApplicationController._process_action_callbacks.find { |cb| cb.filter == :whitelist_check }
  end
end
