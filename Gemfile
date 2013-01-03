source 'http://rubygems.org'

ruby "1.9.3"

gem 'rails', '3.2.10'
gem 'bcrypt-ruby', '~> 3.0.0'
gem 'will_paginate', '~> 3.0'
gem 'devise', '>= 2.0.0'

# markdown and snippets
gem 'pygments.rb', '~> 0.3.2'
gem 'redcarpet', '~> 2.2.2'

# jquery related
gem 'jquery-rails'

#HTML email styles
gem 'roadie', '2.3.4'

#Twitter integration
gem 'twitter', "4.4.1"
gem 'whenever', '0.8.0', :require => false

#Image attachments
gem "paperclip", "3.3.1"

# Tagging
gem "acts-as-taggable-on"

# Settings management
gem 'settingslogic', '~> 2.0.8'

# Search
gem 'pg_search', '0.5.7'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.5'
  gem 'coffee-rails', '~> 3.2.2'
  gem 'uglifier', '>= 1.0.3'
  gem 'twitter-bootstrap-rails', '2.1.7'
end

#to make twitter-bootstrap-rails work properly... sigh.
gem "execjs", "1.4.0"
gem "therubyracer", "0.10.2"
gem 'libv8', '~> 3.3.10'
gem 'less-rails'

group :test do
  gem "ZenTest"
  gem "autotest-notification"
  gem "autotest-rails-pure"
  gem 'simplecov', '~> 0.7.1', :require => false
end

group :development, :test do
  # gem 'annotate', :github => 'ctran/annotate_models'
  gem 'capybara', '2.0.1'
  gem 'launchy'
  gem 'rspec-rails', '2.12.0'
  gem 'database_cleaner', '~> 0.9.1'
  gem 'factory_girl_rails'
  gem "cucumber-rails", "~> 1.0", require: false
  gem "letter_opener", '~> 1.0.0'
  gem 'progress_bar'
  gem 'thin'
end

group :production, :staging do
  gem "pg"
  gem "unicorn"
end

#deployment
gem 'capistrano'
gem 'rvm-capistrano'
