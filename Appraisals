appraise 'rails-4' do
  gem 'rails', '4.2.6'
end

appraise 'rails-5' do
  gem 'rails', '5.1.0'
  gem 'activeresource', github: 'rails/activeresource' # required for shopify_app Rails 5 compatability
  gem 'minitest', '~> 5.10', '!= 5.10.2' # Bug with 5.10.2 which fails tests by mistake
end
