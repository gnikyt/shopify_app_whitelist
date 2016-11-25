ShopifyApp.configure do |config|
  config.api_key            = '<api_key>'
  config.secret             = '<secret>'
  config.scope              = 'read_orders, read_products'
  config.embedded_app       = true
  config.whitelist          = ['allowed.myshopify.com']
  config.whitelist_redirect = '/404.html'
end
