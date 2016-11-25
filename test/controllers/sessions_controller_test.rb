require 'test_helper'

module ShopifyAppWhitelist
  class SessionsControllerTest < ActionController::TestCase
    setup do
      @routes     = ShopifyApp::Engine.routes
      @controller = ShopifyApp::SessionsController.new
    end

    test 'not allowed shop should redirect to configured location' do
      post :create, { shop: 'not-allowed.myshopify.com' }

      assert_response :redirect
      assert response.location.include?(ShopifyApp.configuration.whitelist_redirect)
    end

    test 'allowed shop should be granted access' do
      post :create, { shop: 'allowed.myshopify.com' }

      assert_response :success
      assert response.body.include?('auth/')
    end

    test 'everyone should be granted login page' do
      get :new, { shop: nil }

      assert_response :success
    end

    test 'protection works for each action' do
      [[:post, :create], [:get, :new], [:get, :callback]].each do |method, action|
        send method, action, { shop: 'not-allowed.myshopify.com' }

        assert_response :redirect
        assert response.location.include?(ShopifyApp.configuration.whitelist_redirect)
      end
    end
  end
end
