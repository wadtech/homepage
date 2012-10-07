source 'http://rubygems.org'

ruby "1.9.3"

gem 'rails', '3.2.8'
gem 'bcrypt-ruby', '~> 3.0.0'
gem 'will_paginate', '~> 3.0'
gem 'devise', '>= 2.0.0'

# markdown and snippets
gem 'pygments.rb'
gem 'redcarpet'

# jquery related
gem 'jquery-rails'

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
  gem 'sass-rails',   '~> 3.2.5'
  gem 'coffee-rails', '~> 3.2.2'
  gem 'uglifier', '>= 1.0.3'
  gem 'twitter-bootstrap-rails'
end

group :test do
  gem "ZenTest"
  gem "autotest-growl"
  gem "autotest-rails-pure"
  gem 'simplecov', :require => false
end

group :development, :test do
  # gem 'annotate', :github => 'ctran/annotate_models'
  gem 'capybara'
  gem 'launchy'
  gem 'rspec-rails'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem "cucumber-rails", "~> 1.0", require: false
  gem "letter_opener"
  gem 'progress_bar'
  gem 'thin'
  gem 'sqlite3'
end

group :production, :staging do
  gem 'mysql2'
end