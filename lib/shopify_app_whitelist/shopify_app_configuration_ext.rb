# Add our configuration to ShopifyApp's Configuration
ShopifyApp::Configuration.class_eval do
  attr_accessor :whitelist
  attr_accessor :whitelist_redirect
end
