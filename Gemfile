source 'http://rubygems.org'

gem 'rails', '3.2.6'
gem 'bcrypt-ruby', '~> 3.0.0'
gem 'will_paginate', '~> 3.0'
gem 'devise', '>= 2.0.0'

# markdown and snippets
gem 'pygments.rb'
gem 'redcarpet'

# jquery related
gem 'jquery-rails'

#static content
gem "high_voltage"

#HTML email styles
gem 'roadie'

#Twitter integration
gem 'twitter', ">= 3.0.0.rc.1"
gem 'whenever', :require => false

#Image attachments
gem "paperclip", "~> 3.0"

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'twitter-bootstrap-rails'
end

group :test do
  gem "ZenTest", "~> 4.6.2"
  gem "autotest-growl", "~> 0.2.16"
  gem "autotest-rails-pure", "~> 4.1.2"
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem "cucumber-rails", "~> 1.0", require: false
  gem 'capybara'
  gem 'sqlite3'
end

group :development do
  gem 'annotate', :github => 'ctran/annotate_models'
  gem 'rspec-rails'
  gem "letter_opener"
  gem 'progress_bar'
  gem 'thin'
  gem 'sqlite3'
  gem 'rack-mini-profiler'
end

group :production do
  gem 'mysql2'
end
