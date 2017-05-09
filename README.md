# shopify_app_whitelist

[![Build Status](https://secure.travis-ci.org/tyler-king/shopify_app_whitelist.svg?branch=master)](http://travis-ci.org/tyler-king/shopify_app_whitelist) [![codecov](https://codecov.io/gh/tyler-king/shopify_app_whitelist/branch/master/graph/badge.svg)](https://codecov.io/gh/tyler-king/shopify_app_whitelist) [![Docs](https://inch-ci.org/github/tyler-king/shopify_app_whitelist.svg?branch=master)](https://inch-ci.org/github/tyler-king/shopify_app_whitelist) [![Gem Version](https://badge.fury.io/rb/shopify_app_whitelist.svg)](https://badge.fury.io/rb/shopify_app_whitelist)

This Gem extends [shopify_app](https://github.com/Shopify/shopify_app) to add a whitelist option so only defined shops can access your app for installation.

## Compatibility

Rails 4 and Rails 5 are supported. Appraisal Gem is used to test against both versions.

## Installation

*Assuming shopify_app is already installed*

1. Add `gem 'shopify_app_whitelist'` to your Gemfile
2. Run `bundle install`

## Configuration

1. Open your existing `config/initializers/shopify_app.rb` file
2. Add `whitelist` and `whitelist_redirect` options

Example:

```ruby
ShopifyApp.configure do |config|
  # ...
  config.whitelist          = %w(allowed.myshopify.com another-allowed-shop.myshopify.com)
  config.whitelist_redirect = '/404.html'
  # ...
end
```

## Testing

This Gem is tested. See `test/` or run `bundle rake test` after installing development dependencies.

## How It Works

This Gem adds two configuration options to `ShopifyApp::Configuration` automatically. Using a Railite, it also automatically injects a controller concern into `ApplicationController`.

The concern will check if the current controller is `shopify_app/sessions_controller` and that the action is one of `new`, `create`, or `callback`. If it is, it will check the shop's Shopify domain against the whitelist to see if the shop is allowed to access these methods.
