module ShopifyAppWhitelist
  # Protection Concern for including into the ApplicationController
  module ProtectionConcern
    extend ActiveSupport::Concern

    included do
      # Add our hook on before_action
      before_action :whitelist_check
    end

    protected

    # Checks to ensure a shop is allowed to access ShopifyApp's SessionController methods
    def whitelist_check
      whitelist           = ShopifyApp.configuration.whitelist
      whitelist_redirect  = ShopifyApp.configuration.whitelist_redirect
      shop                = params[:shop]
      controller_match    = params[:controller] == 'shopify_app/sessions'
      action_match        = %w(new create callback).any? { |a| a == params[:action] }

      # Only fire if a whitelist is made, shop param is present in request
      # controller is the sessions controller and action is in the list
      if whitelist.present? && shop.present? && controller_match && action_match
        # Shop is not allowed, redirect to defined location
        redirect_to(whitelist_redirect) unless whitelist.include?(params[:shop])
      end
    end
  end
end
