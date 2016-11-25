module ShopifyAppWhitelist
  module ProtectionConcern
    extend ActiveSupport::Concern

    included do
      before_action :whitelist_check
    end

    protected

    def whitelist_check
      whitelist           = ShopifyApp.configuration.whitelist
      whitelist_redirect  = ShopifyApp.configuration.whitelist_redirect
      shop                = params[:shop]
      controller_match    = params[:controller] == 'shopify_app/sessions'
      action_match        = %w(new create callback).any? { |a| a == params[:action] }

      if whitelist.present? && shop.present? && controller_match && action_match
        redirect_to(whitelist_redirect) unless whitelist.include?(params[:shop])
      end
    end
  end
end
