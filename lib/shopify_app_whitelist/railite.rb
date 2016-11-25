module ShopifyAppWhitelist
  # Railite implementation for the Gem
  class Railtie < Rails::Railtie
    config.after_initialize do
      # Include our concern into the ApplicationController after initialization
      Rails::app_class::ApplicationController.class_eval do
        include ShopifyAppWhitelist::ProtectionConcern
      end
    end
  end
end
