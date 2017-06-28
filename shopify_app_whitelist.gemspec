$:.push File.expand_path('../lib', __FILE__)
require 'shopify_app_whitelist/version'

Gem::Specification.new do |s|
  s.name        = 'shopify_app_whitelist'
  s.version     = ShopifyAppWhitelist::VERSION
  s.authors     = ['Tyler King']
  s.email       = ['tyler.n.king@gmail.com']
  s.homepage    = 'https://github.com/ohmybrew/shopify_app_whitelist'
  s.summary     = 'Adds whitelisting ability to shopify_app'
  s.description = 'Adds a feature to whitelist certain shops to access your shopify_app installation'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails', '>= 4.2.6'
  s.add_dependency 'shopify_app', '~> 7.0', '>= 7.0.1'
  s.add_development_dependency 'appraisal'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'simplecov', '~> 0.12'
  s.add_development_dependency 'codecov', '~> 0.1.4'
  s.add_development_dependency 'yard', '~> 0.8'
  s.add_development_dependency 'inch', '~> 0.7'
  s.add_development_dependency 'rubocop', '~> 0.45'
end
