source 'http://rubygems.org'

ruby "1.9.3"

gem 'rails', '3.2.8'
gem 'bcrypt-ruby', '~> 3.0.0'
gem 'will_paginate', '~> 3.0'
gem 'devise', '>= 2.0.0'

# markdown and snippets
gem 'pygments.rb', '~> 0.3.2'
gem 'redcarpet', '~> 2.2.2'

# jquery related
gem 'jquery-rails'

#HTML email styles
gem 'roadie'

#Twitter integration
gem 'twitter', ">= 4.2.0"
gem 'whenever', :require => false

#Image attachments
gem "paperclip", "~> 3.0"

# Tagging
gem "acts-as-taggable-on"

# Settings management
gem 'settingslogic', '~> 2.0.8'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.5'
  gem 'coffee-rails', '~> 3.2.2'
  gem 'uglifier', '>= 1.0.3'
  gem 'twitter-bootstrap-rails', '2.1.4'
end

group :test do
  gem "ZenTest"
  gem "autotest-notification"
  gem "autotest-rails-pure"
  gem 'simplecov', '~> 0.7.1', :require => false
end

group :development, :test do
  # gem 'annotate', :github => 'ctran/annotate_models'
  gem 'capybara'
  gem 'launchy'
  gem 'rspec-rails', '~> 2.11.4'
  gem 'database_cleaner', '~> 0.9.1'
  gem 'factory_girl_rails'
  gem "cucumber-rails", "~> 1.0", require: false
  gem "letter_opener", '~> 1.0.0'
  gem 'progress_bar'
  gem 'thin'
  gem 'sqlite3'
end

group :production, :staging do
  gem 'mysql2'
end