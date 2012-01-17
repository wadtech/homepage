require 'factory_girl'

Factory.define :admin do |u|
  u.email 'test@test.com'
  u.password 'test'
  u.password_confirmation 'test'
end