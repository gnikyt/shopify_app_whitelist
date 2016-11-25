require 'shopify_app'
require 'shopify_app_whitelist/version'
require 'shopify_app_whitelist/protection'

module ShopifyAppWhitelist
  class Railtie < Rails::Railtie
    config.after_initialize do
      Rails::app_class::ApplicationController.class_eval do
        include ShopifyAppWhitelist::Protection
      end
    end
  end
end
