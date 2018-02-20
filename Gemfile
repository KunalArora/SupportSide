source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'devise'
gem 'json_pure'
gem 'rails', '5.0.0'
gem 'sprockets'
gem 'sprockets-rails', require: 'sprockets/railtie'
gem 'ridgepole'
gem 'sqlite3', '1.3.12'
# Use mysql as the database for Active Record
gem 'mysql2', '~> 0.3.13', '< 0.5'
# Use Puma as the app server
gem 'puma'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
# Haml generators for Rails
gem 'hamlit', '~> 2.2.0'

gem 'will_paginate'

group :test do
  gem 'rails-controller-testing'
  gem 'simplecov', require: false, group: :test
  gem 'timecop', group: :test
end

group :development do
  # Use Capistrano for deployment
  gem 'capistrano', '3.4.0'
  gem 'capistrano-rails', '~> 1.1'
  gem 'capistrano-withrsync'
  gem 'capistrano3-puma'
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'listen', '~> 3.0.5'
  gem 'web-console'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'ruby-debug-ide', '0.6.0'
  gem 'debase', '0.2.2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'mib_parser', path: 'lib/mib_parser'
