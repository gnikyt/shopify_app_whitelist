module ShopifyAppWhitelist
  class Railtie < Rails::Railtie
    config.after_initialize do
      Rails::app_class::ApplicationController.class_eval do
        include ShopifyAppWhitelist::ProtectionConcern
      end
    end
  end
end
