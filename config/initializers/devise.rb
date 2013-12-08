# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|
  require 'devise/orm/active_record'

  config.case_insensitive_keys = [ :email ]
  config.strip_whitespace_keys = [ :email ]
  config.stretches = Rails.env.test? ? 1 : 10

  config.timeout_in = 30.minutes
  config.reset_password_within = 2.hours

  config.sign_out_via = :delete

  config.secret_key = Settings.auth.devise
end
