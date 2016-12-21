require 'test_helper'

module ShopifyAppWhitelist
  class SessionsControllerTest < ActionController::TestCase
    setup do
      @routes     = ShopifyApp::Engine.routes
      @controller = ShopifyApp::SessionsController.new
    end

    test 'not allowed shop should redirect to configured location' do
      if Rails::VERSION::MAJOR >= 5
        post :create, params: { shop: 'not-allowed.myshopify.com' }
      else
        post :create, { shop: 'not-allowed.myshopify.com' }
      end

      assert_response :redirect
      assert response.location.include?(ShopifyApp.configuration.whitelist_redirect)
    end

    test 'allowed shop should be granted access' do
      if Rails::VERSION::MAJOR >= 5
        post :create, params: { shop: 'allowed.myshopify.com' }
      else
        post :create, { shop: 'allowed.myshopify.com' }
      end

      assert_response :success
      assert response.body.include?('auth/')
    end

    test 'everyone should be granted login page' do
      if Rails::VERSION::MAJOR >= 5
        get :new, params: { shop: nil }
      else
        get :new, { shop: nil }
      end

      assert_response :success
    end

    test 'protection works for each action' do
      [[:post, :create], [:get, :new], [:get, :callback]].each do |method, action|
        if Rails::VERSION::MAJOR >= 5
          send(method, action, params: { shop: 'not-allowed.myshopify.com' })
        else
          send(method, action, { shop: 'not-allowed.myshopify.com' })
        end

        assert_response :redirect
        assert response.location.include?(ShopifyApp.configuration.whitelist_redirect)
      end
    end
  end
end
