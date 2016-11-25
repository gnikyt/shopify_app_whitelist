module ShopifyAppWhitelist
  module Protection
    extend ActiveSupport::Concern

    included do
      before_action :whitelist_check
      puts 8
    end

    protected

    def whitelist_check
      if has_shop_param? && controller_matches? && action_matches? && has_whitelist?
        redirect_to(Rails.configuration.shopify_app_whitelist_redirect) unless Rails.configuration.shopify_app_whitelist.include?(params[:shop])
      end
    end

    private

    def has_whitelist?
      Rails.configuration.shopify_app_whitelist.present?
    end

    def has_shop_param?
      params[:shop].present?
    end

    def controller_matches?
      params[:controller] == 'shopify_app/sessions'
    end

    def action_matches?
      %w(new create callback).any? { |a| a == params[:action] }
    end
  end
end
