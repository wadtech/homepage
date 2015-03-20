source "http://rubygems.org"
ruby "2.1.2"

def is_mac?
  RUBY_PLATFORM.downcase.include?("darwin")
end

def is_linux?
  RUBY_PLATFORM.downcase.include?("linux")
end

group :test do
  gem "guard", "~> 2.10"
  gem "guard-rspec", "~> 4.5"
  gem "guard-bundler"
  gem "guard-migrate"
  gem "rb-inotify", "~> 0.9" if is_linux?
  gem "rb-fsevent", "~> 0.9" if is_mac?
  gem "simplecov", "~> 0.7", :require => false
end

group :development do
  gem "better_errors", "~> 2.0"
  gem "binding_of_caller", "~> 0.7.2"
  gem "meta_request", "~> 0.3"
end

group :test, :development do
  gem "faker"
  gem "spring"
  gem "capybara", "~> 2.4"
  gem "launchy", "~> 2.4"
  gem "rspec-rails", "~> 3.0"
  gem "database_cleaner", "~> 1.3"
  gem "factory_girl_rails", "~> 4.5"
  gem "letter_opener", "~> 1.3"
  gem "progress_bar", "~> 1.0.0"
  gem "thin", "~> 1.6"
end

group :production do
  gem "unicorn", "~> 4.8"
  gem "google-analytics-rails", "~> 0.0.6"
end

gem "pg", "~> 0.17"

gem "rails", "~> 4.2"
gem "bcrypt", "~> 3.1"
gem "will_paginate", "~> 3.0"
gem "devise", "~> 3.4"
gem "pygments.rb", "~> 0.6"
gem "redcarpet", "~> 3.2"
gem "jquery-rails", "~> 4.0"
gem "jquery-ui-rails", "~> 5.0"
gem "roadie", "~> 3.0"
gem "roadie-rails", github: 'sgringwe/roadie-rails'
gem "twitter", "~> 5.13"
gem "paperclip", "~> 4.2"
gem "acts-as-taggable-on", "~> 3.4"
gem "settingslogic", "~> 2.0.9"
gem "pg_search", "~> 0.7"
gem "route_downcaser", "~> 0.2"
gem "sass-rails"
gem "coffee-rails", "~> 4.1"
gem "uglifier", "~> 2.6"
gem "capistrano", "~> 3.3"
gem "rvm-capistrano", "~> 1.5"
gem "octokit", "~> 3.7"
gem 'compass-rails'
gem 'oily_png', '~> 1.1'
