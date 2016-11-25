# shopify_app_whitelist

This Gem extends [shopify_app](https://github.com/Shopify/shopify_app) to add a whitelist option so only defined shops can access your app for installation.

# Installation

1. Add `gem 'shopify_app_whitelist'` to your Gemfile
2. Run `bundle install`

# Configuration

1. Open your existing `config/initializers/shopify_app.rb` file
2. Add `whitelist` and `whitelist_redirect` options

Example:

```ruby
ShopifyApp.configure do |config|
  # ...
  config.whitelist          = ['allowed.myshopify.com', 'another-allowed-shop.myshopify.com']
  config.whitelist_redirect = '/404.html'
  # ...
end
```

# Testing

This Gem is tested. See `test/` or run `bundle rake test` after installing development dependencies.
