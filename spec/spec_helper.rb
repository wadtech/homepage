require 'simplecov'
SimpleCov.start 'rails'

# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|

  # Disabling garbage collection for the duration of tests is a terrible idea! Works though.
  config.before :each do
    GC.disable
  end

  config.after :each do
    GC.enable
  end

  config.fail_fast = true
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"
  config.filter_run_excluding :broken => true
  config.infer_spec_type_from_file_location!
end
