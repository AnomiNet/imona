source 'https://rubygems.org'

gem 'faraday_middleware', '~> 0.9'
gem 'her', '~> 0.7'
gem 'puma', '~> 2.11'
gem 'rails', '~> 4.2'
gem 'request_store', '~> 1.1'
gem 'slim', '~> 3.0'

# Rails 4 removed the assets group, however keeping it as a separate group
# lets us run prod without assets dependencies.
# To include this group set env ASSETS=1
# For this logic see config/application.rb
group :assets do
  gem 'bower-rails', '~> 0.9'
  gem 'sass-rails', '~> 5.0'
  gem 'sprockets-es6', '~> 0.6'
  gem 'uglifier', '>= 1.3.0'
end

group :development, :test do
  gem 'pry-byebug', '~> 3.1'
  gem 'pry-rails', '~> 0.3'
  gem 'web-console', '~> 2.0'
end
