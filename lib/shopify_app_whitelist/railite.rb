module ShopifyAppWhitelist
  # Railite implementation for the Gem
  class Railtie < Rails::Railtie
    config.after_initialize do
      # Include our concern into the ActionController::Base
      ActionController::Base.class_eval do
        include ShopifyAppWhitelist::ProtectionConcern
      end
    end
  end
end
