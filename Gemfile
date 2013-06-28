source 'http://rubygems.org'

ruby "2.0.0"

gem 'rails', '4.0.0'
gem 'bcrypt-ruby', '~> 3.0.0'
gem 'will_paginate', '~> 3.0'
gem 'devise', '~> 3.0.0.rc'

# markdown and snippets
gem 'pygments.rb', :github => 'tmm1/pygments.rb'
gem 'redcarpet', '~> 2.3.0'

gem 'jquery-rails', '3.0.1'
gem 'jquery-ui-rails', '4.0.3'

# HTML email styles
# Not compatible with rails4
gem 'roadie', github: 'dmarkow/roadie'

#Twitter integration
gem 'twitter', "~> 4.8.1"
gem 'whenever', '~> 0.8.0', :require => false

#Image attachments
gem "paperclip", "~> 3.4.0"

# Tagging
gem "acts-as-taggable-on", "~> 2.4.1"

# Settings management
gem 'settingslogic', '~> 2.0.8'

# Search
gem 'pg_search', '~> 0.6.0'

# take that, w3c!
gem 'route_downcaser', '0.2.0'

gem 'sass-rails',   '~> 4.0.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'

gem 'bootstrap-sass', '~> 2.3.1.0'

group :test do
  gem "guard", "~> 1.8.0"
  gem "guard-rspec", "~> 3.0.0"
  gem 'guard-bundler'
  gem "rb-inotify"
  gem "zeus"
  gem 'simplecov', '~> 0.7.1', :require => false
end

group :development do
  gem 'better_errors', '~> 0.8.0'
  gem 'binding_of_caller'
  gem 'meta_request', '~> 0.2.0'
end

group :development, :test do
  gem 'capybara', '~> 2.1.0'
  gem 'launchy'
  gem 'rspec-rails', '~> 2.13.2'
  gem 'database_cleaner', '~> 1.0.1'
  gem 'factory_girl_rails', '4.2.1'
  gem "cucumber-rails", "~> 1.0", :require => false
  gem "letter_opener", '~> 1.1.0'
  gem 'progress_bar'
  gem 'thin', '~> 1.5.0'
end

group :development, :production, :test do
  gem "pg", '~> 0.15.0'
end

group :production do
  gem "unicorn", '~> 4.6.3'
  gem 'google-analytics-rails'
end

#deployment
gem 'capistrano', '~> 2.15.4'
gem 'rvm-capistrano', '~> 1.3.4'
