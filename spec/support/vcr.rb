require 'spec_helper'

VCR.configure do |config|
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.hook_into :webmock # or :fakeweb
  config.filter_sensitive_data('<API TOKEN>') { Settings.github.access_token }
end
